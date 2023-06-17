function CatspeakLiveExecute(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    if (not CatspeakLiveExists(_name))
    {
        if (not CATSPEAK_LIVE_FAIL_QUIETLY) __CatspeakLiveError("File \"", _name, "\" not found");
        return undefined;
    }
    
    return __global.__fileWatcherStruct[$ __CatspeakLiveGetPath(_name)].__Execute();
}