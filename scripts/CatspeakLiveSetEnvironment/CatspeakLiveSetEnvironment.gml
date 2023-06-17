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
        
        if (_oldEnvironment == undefined)
        {
            catspeak_force_init();
            
            if (GM_build_type == "run")
            {
                //Expose Catspeak Live state for inspection
                if (debug_mode) global.catspeakLive = __CatspeakLiveGlobal();
                
                if (CATSPEAK_LIVE_AUTO_UPDATE_WHEN_RUNNING_FROM_IDE)
                {
                    //Start a per-frame scan
                    __global.__autoScan = true;
                    time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, CatspeakLiveForceUpdate, [], -1));
                }
            }
            
            if (_forceScan) CatspeakLiveForceUpdate();
        }
    }
}