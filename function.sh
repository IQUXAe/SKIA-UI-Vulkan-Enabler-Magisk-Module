print_props() {
    local NAME="debug.hwui.renderer"
    local VAL=$(getprop "$NAME")
    ui_print "  $NAME=$VAL"
    
    NAME="debug.renderengine.backend"
    VAL=$(getprop "$NAME")
    ui_print "  $NAME=$VAL"
}

# Clean
remove_legacy_junk() {
    for DIR in \
        "/metadata/magisk/$MODID" \
        "/mnt/vendor/persist/magisk/$MODID" \
        "/persist/magisk/$MODID" \
        "/data/unencrypted/magisk/$MODID" \
        "/cache/magisk/$MODID" \
        "/cust/magisk/$MODID"; do
        
        if [ -d "$DIR" ]; then
            rm -rf "$DIR"
        fi
    done
}

remove_sepolicy_rule() {
    remove_legacy_junk
}
