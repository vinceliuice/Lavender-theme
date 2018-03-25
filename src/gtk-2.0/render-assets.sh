#! /bin/bash
set -ueo pipefail

INDEX="assets.txt"

_parallel() {
  which parallel && parallel $@ || (
    while read i; do
      $1 $i
    done
  )
}

cat $INDEX | _parallel ./render-asset.sh
cat $INDEX | _parallel ./render-asset-azul.sh
exit 0
