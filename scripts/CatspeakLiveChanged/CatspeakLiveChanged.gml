/// Returns if a Catspeak source file was changed since the last time this function was called
/// 
/// @param sourceName

function CatspeakLiveChanged(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    if (not CatspeakLiveExists(_name))
    {
        if (not CATSPEAK_LIVE_QUIET_ERRORS) __CatspeakLiveError("File \"", _name, "\" not found");
        return false;
    }
    
    return __global.__fileWatcherStruct[$ __CatspeakLiveGetPath(_name)].__IsChanged();
}