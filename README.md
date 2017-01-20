# zclassic-blocks

Backups ZClassic blockchain.

Container is used in zclassic-docker - no need to download all ZClassic blockchain.

## Download ZClassic blockchain

- To download latest ZClassic blockchain visit [Release page](https://github.com/fxminer/zclassic-blocks/releases).

Delete: 
```
.zclassic/blocks
.zclassic/chainstate
```

Download latest zclassic-blocks_\<BLOCK_NUMBER\>.7z and extract to your .zclassic folder (use [7zip](http://www.7-zip.org/download.html))

## Create blockchain archive

```
./init.sh
./getblocks.sh
# Current status
zcl-logs 
# After blockchain is synchronized
zcl-archive
exit
```
