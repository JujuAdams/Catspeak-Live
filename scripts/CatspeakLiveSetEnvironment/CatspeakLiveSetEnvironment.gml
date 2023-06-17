function CatspeakLiveSetEnvironment(_environment)
{
    static __global = __CatspeakLiveGlobal();
    
    __global.__environment = _environment;
}