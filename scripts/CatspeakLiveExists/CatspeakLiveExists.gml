/// Returns if a Catspeak source file exists
/// This function will ignore whether the source file compiled successfully or not
/// 
/// @param sourceName

function CatspeakLiveExists(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    return variable_struct_exists(__global.__fileWatcherStruct, __CatspeakLiveGetPath(_name));
}