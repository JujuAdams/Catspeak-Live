function CatspeakLiveExecute(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    if (not CatspeakLiveCompiled(_name, true))
    {
        if (not CATSPEAK_LIVE_QUIET_ERRORS) __CatspeakLiveError("File \"", _name, "\" has not been compiled successfully");
        return undefined;
    }
    
    return __global.__fileWatcherStruct[$ __CatspeakLiveGetPath(_name)].__Execute();
}