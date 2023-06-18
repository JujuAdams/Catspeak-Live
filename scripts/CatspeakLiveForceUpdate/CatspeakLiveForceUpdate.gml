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
    var _environment = __global.__environment;
    
    if (_environment == undefined)
    {
        __CatspeakLiveError("Must call CatspeakLiveSetEnvironment() first");
    }
    
    var _newFileArray = __CatspeakLiveGumshoe(__CatspeakLiveDatafilesDirectory(), CATSPEAK_LIVE_SOURCE_EXTENSION);
    
    array_sort(_newFileArray, true);
    if (not array_equals(_newFileArray, __global.__fileArray))
    {
        __global.__fileArray = _newFileArray;
        __CatspeakLiveTrace("Change in source files detected");
    }
    
    var _fileArray = __global.__fileArray;
    var _fileWatcherStruct = __global.__fileWatcherStruct;
    
    //Manage the cache
    var _i = 0;
    repeat(array_length(_fileArray))
    {
        var _name = _fileArray[_i];
        var _filename = __CatspeakLiveGetPath(_name);
        
        if (not file_exists(_filename))
        {
            array_delete(_fileArray, _i, 1);
            variable_struct_remove(_fileWatcherStruct, _name);
            
            if (CATSPEAK_LIVE_ADD_SOURCE_FILES_TO_ENVIRONMENT)
            {
                _environment.removeFunction(_name);
            }
        }
        else
        {
            var _watcher = _fileWatcherStruct[$ _name];
            
            if (_watcher == undefined)
            {
                _watcher = new __CatspeakLiveClassFileWatcher(_name);
                _fileWatcherStruct[$ _name] = _watcher;
                
                if (CATSPEAK_LIVE_ADD_SOURCE_FILES_TO_ENVIRONMENT)
                {
                    _environment.addFunction(_name, method({ __name: _name }, function()
                    {
                        return CLExec(__name);
                    }));
                }
            }
            
            ++_i;
        }
    }
    
    //Check for changes and recompile if necessary
    var _i = 0;
    repeat(array_length(_fileArray))
    {
        var _watcher = _fileWatcherStruct[$ _fileArray[_i]].__Check();
        ++_i;
    }
}