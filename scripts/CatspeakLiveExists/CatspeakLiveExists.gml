function CatspeakLiveExists(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    return variable_struct_exists(__global.__fileWatcherStruct, __CatspeakLiveGetPath(_name));
}