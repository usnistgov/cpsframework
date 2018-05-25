#! /bin/sh
#
D="`dirname $0`"
if [ -z "$D" ]; then
        D="`pwd`"
fi
cd "$D"
chmod 0755 asklab/cpsf/dlv/dlv asklab/cpsf/mkatoms-2.15/mkatoms-linux-x86
java asklab.ui.ReasonerUI
