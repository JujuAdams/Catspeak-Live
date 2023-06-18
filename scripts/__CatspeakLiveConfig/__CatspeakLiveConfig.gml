//File extension to use for Catspeak source files
//These files should be placed in your "datafiles" directory on disk
#macro CATSPEAK_LIVE_SOURCE_EXTENSION  "cats"

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

//Catspeak Live can add its own functions to the environment when it is set with CatspeakLiveSetEnvironment()
//Setting this to <true> allows for Catspeak scripts to call each other but it can also be a significant
//security risk due to the possibility of arbitrary code execution
//
//The functions that are added to the environment are as follows:
//    CatspeakLiveExecute()
//    CatspeakLiveExists()
//    CatspeakLiveCompiled()
//    CatspeakLiveChanged()
//    CLExec()
//    CLExists()
//    CLCompiled()
//    CLChanged()
#macro CATSPEAK_LIVE_ADD_CL_FUNCTIONS_TO_ENVIRONMENT  false

//Whether to expose Catspeak Live functions as executable instructions
#macro CATSPEAK_LIVE_ADD_SOURCE_FILES_TO_ENVIRONMENT  false