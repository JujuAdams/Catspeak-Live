//File extension to use for Catspeak source files
//These files should be placed in your "datafiles" directory on disk
#macro CATSPEAK_LIVE_SOURCE_EXTENSION  "catscr"

//Whether to ignore certain errors that might get in the way of speedy development
//Set to <false> to track down simple human error, set to <true> to give yourself some leeway!
#macro CATSPEAK_LIVE_QUIET_ERRORS  false

//Whether to automatically scan for changes when running from the IDE
//Set this macro to <false> to test behaviour in production (and also for a speed boost)
#macro CATSPEAK_LIVE_AUTO_UPDATE_WHEN_RUNNING_FROM_IDE  true

//Setting this to <true> will wrap every CatspeakLiveExecute() inside a try...catch block
//internally. This means that any errors encountered whilst running Catspeak scripts will be
//caught and reported in the output log instead of throwing an exception and crashing the
//entire game
#macro CATSPEAK_LIVE_SAFE_EXECUTION  false