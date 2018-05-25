#!/bin/sh
#

BASEDIR="`dirname "$0"`"

export JENAROOT="$BASEDIR/apache-jena-3.0.0/"

"$BASEDIR/apache-jena-3.0.0/bin/sparql" $*

