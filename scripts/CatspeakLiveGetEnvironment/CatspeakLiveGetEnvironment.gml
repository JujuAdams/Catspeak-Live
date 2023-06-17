/// Returns the Catspeak environment that Catspeak Live is using

function CatspeakLiveGetEnvironment()
{
    static __global = __CatspeakLiveGlobal();
    
    return __global.__environment;
}