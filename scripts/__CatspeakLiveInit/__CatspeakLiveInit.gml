if (GM_build_type == "run")
{
    global.catspeakLive = __CatspeakLiveGlobal();
    time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, __CatspeakScan, [], -1));
}
else
{
    __CatspeakScan();
}