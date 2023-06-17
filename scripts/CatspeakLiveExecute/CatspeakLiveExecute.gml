/// Tries to execute a Catspeak source file with the given name
/// 
/// @param sourceName

function CatspeakLiveExecute(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    if (not CatspeakLiveCompiled(_name, true))
    {
        if (not CATSPEAK_LIVE_QUIET_ERRORS) __CatspeakLiveError("File \"", _name, "\" has not been compiled successfully");
        return undefined;
    }
    
    return __global.__fileWatcherStruct[$ __CatspeakLiveGetPath(_name)].__Execute();
}