/// Sets the environment to use for Catspeak Live
/// If you're not sure what to use, call the following:
/// 
///     CatspeakLiveSetEnvironment(Catspeak);
/// 
/// If the forceScan argument is set to <true> then this function will also trigger a recompile
/// of all Catspeak source files
/// 
/// N.B. Catspeak Live won't work until this function is called!
/// 
/// @param environment
/// @param [forceScan=true]

function CatspeakLiveSetEnvironment(_environment, _forceScan = true)
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment != _environment)
    {
        var _oldEnvironment = __global.__environment;
        __global.__environment = _environment;
        
        if (_oldEnvironment == undefined) __CatspeakLiveInit(_forceScan);
    }
}