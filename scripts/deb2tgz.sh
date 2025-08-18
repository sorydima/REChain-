#!/bin/sh
# Copyright 2016 Vitor Borrego, Corroios, Portugal
# Heavily based on deb2tgz (https://code.google.com/archive/p/deb2tgz/) created by Marcos Henrique Esteves Barbosa 
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
CURRDIR=$(pwd)

if [ "$1" = "" ]; then
    echo "$0:  Converts DEB format to standard GNU tar + (GZ/XZ/LZ/BZ) format."
    echo "    (view converted packages with \"less\", install and remove"
    echo "    with \"installpkg\", \"removepkg\", \"pkgtool\", or manually"
    echo "    with \"tar\")"
    echo
    echo "Usage:    $0 <file.deb>"
    echo "    (Outputs \"file.t*z\")"
    exit 1;
fi

# Create a new temporary directory with a secure filename:
make_temp_dir()
{
    if [ -x "$(which mcookie)" ]; then
        tempd=/tmp/tmp.$(mcookie)
        mkdir -p -m 0755 $tempd
    elif [ -x "$(which openssl)" ]; then
        tempd=/tmp/tmp.$(dd if=/dev/urandom bs=1k count=1 2> /dev/null | openssl dgst -md5)
        mkdir -p -m 0755 $tempd
    elif [ -x "$(which md5)" ]; then
        tempd=/tmp/tmp.$(dd if=/dev/urandom bs=1k count=1 2> /dev/null | md5)
        mkdir -p -m 0755 $tempd
    elif [ -x "$(which mktemp)" ]; then
        tempd=$(mktemp -d)
        chmod 755 $tempd
    fi

    if [ -d $tempd ]; then # success, return the name of the directory:
        echo $tempd
    else
        echo "ERROR:  Could not find mcookie, openssl, or md5."
        echo "        Exiting since a secure temporary directory could not be made."
       exit 1
    fi
}

for debfile in $* ; do
    # Create a temporary directory:
    TMPDIR=$(make_temp_dir)

    # Extract the DEB:
    # Extract the file data.* from package $debfile 
    cp $debfile $TMPDIR
    cd $TMPDIR
    ar x $debfile 2> /dev/null
    # echo $TMPDIR
    # ls $TMPDIR
    #mv $DATAFILE $TMPDIR
    if [ ! $? = 0 ]; then
        echo "ERROR:  ar failed. (maybe $debfile is not an DEB?)"
        rm -rf $TMPDIR
        continue
    fi

    # Repack the files in the right archive:
    if [ "`basename $0`" = "deb2tgz" ]; then
        if [ -f "$TMPDIR/data.tar.gz" ]
        then
          mv $TMPDIR/data.tar.gz $CURRDIR/$(basename $debfile .deb).tgz
        fi

        if [ -f "$TMPDIR/data.tar.xz" ]
        then
          mv $TMPDIR/data.tar.xz $CURRDIR/$(basename $debfile .deb).txz 
        fi
 
        if [ -f "$TMPDIR/data.tar.bz2" ]
        then
          mv $TMPDIR/data.tar.bz2 $CURRDIR/$(basename $debfile .deb).tbz
        fi

        if [ -f "$TMPDIR/data.tar.lzma" ]
        then
          mv $TMPDIR/data.tar.lzma $CURRDIR/$(basename $debfile .deb).tlz
        fi

        # Added suggested support for zst as mentioned in issue 1 created by @sevens.
        # Check commits sevens@9a99096 and sevens@9829fbf 
        # https://github.com/sevens/deb2tgz/commit/9a990965577c286a268ac982172cc502564c155f
        # https://github.com/sevens/deb2tgz/commit/9829fbf1309439b96dfa9f93a79c486491daabbf
        if [ -f "$TMPDIR/data.tar.zst" ]
        then
          THREADS=0
          if [ "$(uname -m)" = "x86_64" ] || [ "$(uname -m)" = "aarch64" ] || ["$(uname -m)" = "riscv64"]
          then
            THREADS=2
          fi
          pzstd --decompress --stdout $TMPDIR/data.tar.zst | xz --compress --threads=$THREADS - > $CURRDIR/$(basename $debfile .deb).txz
          rm "$TMPDIR/data.tar.zst"
        fi
    fi

    # Remove temporary directory:
    rm -rf $TMPDIR
done
cd $CURRDIR

