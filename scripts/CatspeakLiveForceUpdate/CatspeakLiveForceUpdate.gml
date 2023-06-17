/// Forces a scan of the datafiles folder
/// 
/// Any files that have found to have changed, or have been newly added, will be recompiled
/// immediately, making them ready for use
/// 
/// If you're running from the IDE and have CATSPEAK_LIVE_AUTO_UPDATE_WHEN_RUNNING_FROM_IDE set
/// to <true> then you won't need to call this function

function CatspeakLiveForceUpdate()
{
    static __global = __CatspeakLiveGlobal();
    
    if (__global.__environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    var _newArray = __CatspeakLiveGumshoe(__CatspeakLiveDatafilesDirectory(), CATSPEAK_LIVE_SOURCE_EXTENSION, false, false, undefined, true);
    
    array_sort(_newArray, true);
    if (not array_equals(_newArray, __global.__fileArray))
    {
        __global.__fileArray = _newArray;
        __CatspeakLiveTrace("Change in source files detected");
    }
    
    var _fileArray = __global.__fileArray;
    var _fileWatcherStruct = __global.__fileWatcherStruct;
    
    var _i = 0;
    repeat(array_length(_fileArray))
    {
        var _filename = _fileArray[_i];
        if (not file_exists(_filename))
        {
            array_delete(_fileArray, _i, 1);
            variable_struct_remove(_fileWatcherStruct, _filename);
        }
        else
        {
            var _watcher = _fileWatcherStruct[$ _filename];
            
            if (_watcher == undefined)
            {
                _watcher = new __CatspeakLiveClassFileWatcher(_filename);
                _fileWatcherStruct[$ _filename] = _watcher;
            }
            
            _watcher.__Check();
            
            ++_i;
        }
    }
}