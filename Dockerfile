FROM ubuntu:16.04

ENV ZCL_SCRIPTS=/usr/local/zclassic \
    ZCL_HOME=/home/zcl 
ENV ZCLASSIC_DATA_DIR=${ZCL_HOME}/.zclassic 
ENV ZCLASSIC_DATA=/usr/share/zclassic
ENV ZCLASSIC_STORAGE=${ZCLASSIC_DATA}/storage \
    ZCLASSIC_BLOCKS=${ZCLASSIC_DATA}/blockchain
	
RUN useradd -ms /bin/bash zcl

RUN apt-get -y update && \
    apt-get -y install \
        p7zip-full mc sudo vim-tiny && \
    \
    # Clean apt
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -Rf /var/lib/apt/lists/*

ADD ./scripts/* ${ZCL_SCRIPTS}/
ADD ./init/* ${ZCL_SCRIPTS}/init/

RUN mkdir -p "${ZCLASSIC_BLOCKS}"

ADD ./share/zclassic-blocks*.7z ${ZCLASSIC_BLOCKS}/

RUN cd "${ZCLASSIC_BLOCKS}" && \
	7z x -y zclassic-blocks*.7z && \
	rm -f zclassic-blocks*.7z 

ENTRYPOINT ["/usr/local/zclassic/zclassic_entrypoint.sh"]

RUN chown -R zcl:zcl "${ZCL_SCRIPTS}" "${ZCL_HOME}"

VOLUME ["/usr/share/zclassic/blockchain"]

WORKDIR /usr/local/zclassic
