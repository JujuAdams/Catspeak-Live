function CatspeakLiveExists(_name)
{
    static __global = __CatspeakLiveGlobal();
    
    var _watcher = __global.__fileWatcherStruct[$ __CatspeakLiveGetPath(_name)];
    return (_watcher == undefined)? false : _watcher.__compiled;
}