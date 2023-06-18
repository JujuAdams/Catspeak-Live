/// Tries to execute a Catspeak source file with the given name
/// 
/// @param sourceName
/// @param [safe=CATSPEAK_LIVE_SAFE_EXECUTION]
/// @parma [JIT=false]

function CatspeakLiveExecute(_name, _safe = CATSPEAK_LIVE_SAFE_EXECUTION, _jit = false)
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    if (not CatspeakLiveExists(_name))
    {
        if (not CATSPEAK_LIVE_QUIET_ERRORS) __CatspeakLiveError("Source file \"", _name, "\" not found");
        return undefined;
    }
    
    if (not CatspeakLiveCompiled(_name) && not _jit)
    {
        return undefined;
    }
    
    return __global.__fileWatcherStruct[$ _name].__Execute(_safe);
}