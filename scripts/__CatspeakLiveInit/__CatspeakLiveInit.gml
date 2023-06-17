#macro __CATSPEAK_LIVE_VERSION  "1.0.0"
#macro __CATSPEAK_LIVE_DATE     "2023-06-17"

__CatspeakLiveTrace("Welcome to Catspeak Live by Juju Adams! This is version ", __CATSPEAK_LIVE_VERSION, ", ", __CATSPEAK_LIVE_DATE);
__CatspeakLiveTrace("Catspeak Live is built upon Catspeak by @katsaii  https://github.com/katsaii/catspeak-lang");

function __CatspeakLiveInit(_forceScan)
{
    try
    {
        script_exists(catspeak_force_init);
        if (CATSPEAK_VERSION != "3.0.0") throw "!";
    }
    catch(_error)
    {
        __CatspeakLiveError("Catspeak Live should be used with Catspeak 3.0.0\nhttps://github.com/katsaii/catspeak-lang");
    }
    
    catspeak_force_init();
    
    if (GM_build_type == "run")
    {
        //Expose Catspeak Live state for inspection
        if (debug_mode) global.catspeakLive = __CatspeakLiveGlobal();
        
        if (CATSPEAK_LIVE_AUTO_UPDATE_WHEN_RUNNING_FROM_IDE)
        {
            //Start a per-frame scan
            time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, CatspeakLiveForceUpdate, [], -1));
        }
    }
    
    if (_forceScan) CatspeakLiveForceUpdate();
}