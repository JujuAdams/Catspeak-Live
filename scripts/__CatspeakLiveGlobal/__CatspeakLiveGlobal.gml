function __CatspeakLiveGlobal()
{
    static _struct = undefined;
    
    if (_struct == undefined)
    {
        catspeak_force_init();
        
        _struct = {
            __fileArray: [],
            __fileWatcherStruct: {},
            __environment: Catspeak,
        };
    }
    
    return _struct;
}