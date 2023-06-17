function __CatspeakLiveGlobal()
{
    static _struct = {
        __fileArray: [],
        __fileWatcherStruct: {},
        __environment: CATSPEAK_LIVE_USE_DEFAULT_ENVIRONMENT? Catspeak : (new CatspeakEnvironment()),
    };
    
    return _struct;
}