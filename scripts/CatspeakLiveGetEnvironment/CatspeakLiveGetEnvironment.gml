function CatspeakLiveGetEnvironment()
{
    static __global = __CatspeakLiveGlobal();
    
    return __global.__environment;
}