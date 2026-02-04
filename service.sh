#!/system/bin/sh
MODPATH=${0%/*}

# Log
exec 2>"$MODPATH/debug.log"
set -x

# Force SkiaVK
resetprop debug.hwui.renderer skiavk
resetprop debug.renderengine.backend skiavkthreaded
