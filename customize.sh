# Header
ui_print " "
ui_print "--------------------------------------"
ui_print "      SKIA UI Vulkan Enabler          "
ui_print "--------------------------------------"
ui_print " "

UID=$(id -u)
[ -z "$UID" ] && UID=0

if [ "$BOOTMODE" != true ]; then
  LOG_FILE="/data/media/$UID/$MODID_recovery.log"
  ui_print "- Log will be saved at $LOG_FILE"
  exec 2>"$LOG_FILE"
  ui_print " "
else
  ui_print "- Installing in Magisk environment"
fi

if [ -f "$MODPATH/function.sh" ]; then
    . "$MODPATH/function.sh"
fi

# Info
MODVER=$(grep_prop version "$MODPATH/module.prop")
MODVERCODE=$(grep_prop versionCode "$MODPATH/module.prop")

ui_print " ID: $MODID"
ui_print " Version: $MODVER ($MODVERCODE)"

if [ "$KSU" == true ]; then
  ui_print " Environment: KernelSU (v$KSU_VER)"
else
  ui_print " Environment: Magisk (v$MAGISK_VER)"
fi
ui_print " "

ui_print "- Cleaning up old settings..."
if [ -f "$MODPATH/function.sh" ]; then
    if type remove_sepolicy_rule >/dev/null 2>&1; then
        remove_sepolicy_rule
    fi
fi

ui_print "- Configuring module..."
ui_print "  Forces Skia Vulkan renderer (skiavk)"
ui_print " "

# Set permissions
set_perm_recursive "$MODPATH" 0 0 0755 0644

if [ "$BOOTMODE" == true ]; then
    ui_print "- Note: Changes will persist after reboot."
    ui_print "  However, attempting to apply props now..."
    
    sh "$MODPATH/service.sh"
    
    ui_print "  Done."
fi

ui_print " "
ui_print "--------------------------------------"
ui_print "  Installation Complete"
ui_print "--------------------------------------"
ui_print " "
