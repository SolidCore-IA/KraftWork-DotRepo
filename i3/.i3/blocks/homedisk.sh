#!/bin/sh
df -h -P -l "${BLOCK_INSTANCE:-$HOME}" | awk '/\// { print $4 }'
