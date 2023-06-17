/// Tries to execute a Catspeak source file with the given name
/// 
/// @param sourceName
/// @param [safe=CATSPEAK_LIVE_SAFE_EXECUTION]

function CatspeakLiveExecute(_name, _safe = CATSPEAK_LIVE_SAFE_EXECUTION)
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    if (not CatspeakLiveExists(_name))
    {
        if (not CATSPEAK_LIVE_QUIET_ERRORS) __CatspeakLiveError("File \"", _name, "\" not found");
        return undefined;
    }
    
    return __global.__fileWatcherStruct[$ __CatspeakLiveGetPath(_name)].__Execute(_safe);
}