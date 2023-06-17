//File extension to use for Catspeak source files
//These files should be placed in your "datafiles" directory on disk
#macro CATSPEAK_LIVE_SOURCE_EXTENSION  "catscr"

//Whether to ignore certain errors that might get in the way of speedy development
//Set to <false> to track down simple human error, set to <true> to give yourself some leeway!
#macro CATSPEAK_LIVE_QUIET_ERRORS  false

//Whether to automatically scan for changes when running from the IDE
//If you set this to <false> then you'll need to call CatspeakLiveForceScan() yourself
#macro CATSPEAK_LIVE_AUTOSCAN_WHEN_RUNNING_FROM_IDE  true