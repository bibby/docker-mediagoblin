#!/bin/bash
set -e

# change this path to suit your needs
mg_volume=${1:-/volumes/mediagoblin}

db="$mg_volume/mediagoblin.db"
pub="$mg_volume/public"

# prepares the volume if necessary
[ -d "$mg_volume" ] || mkdir -p "$mg_volume"
[ -f "$db" ] || touch "$db"
[ -d "$pub" ] || mkdir "$pub"


docker run -d \
    -p 80:6543 \
    -v "$mg_volume:/opt/mediagoblin" \
    bbby/mediagoblin
