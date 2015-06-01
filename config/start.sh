#!/bin/bash
src=/var/lib/mediagoblin
vpub=/opt/mediagoblin/public
pub=/var/lib/mediagoblin/user_dev/media/public
cd $src

echo "Linking mediagoblin.db .."
ln -s /opt/mediagoblin/mediagoblin.db /var/lib/mediagoblin/mediagoblin.db

[ -d $vpub ] && {

	[ -d "$pub" ] && { 
		mv $pub ${pub}_
		echo "Moving $pub ${pub}_ .."
	}

	mkdir -p $(dirname "$pub")
	echo "Linking $vpub -> $pub .."
	ln -s $vpub $pub
}

/usr/local/bin/gmg dbupdate 
./lazyserver.sh --server-name=broadcast

