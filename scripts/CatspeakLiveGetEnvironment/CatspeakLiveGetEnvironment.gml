function CatspeakLiveGetEnvironment(_environment)
{
    static __global = __CatspeakLiveGlobal();
    
    return __global.__environment;
}