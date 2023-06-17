/// Returns if a Catspeak source file was compiled successfully
/// This function won't throw an error if the source file doesn't exist
/// 
/// @param sourceName

function CatspeakLiveCompiled(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    if (not CatspeakLiveExists(_name)) return false;
    
    return __global.__fileWatcherStruct[$ __CatspeakLiveGetPath(_name)].__compileSuccess;
}