function __CatspeakLiveClassFileWatcher(_filename) constructor
{
    static __global = __CatspeakLiveGlobal();
    
    __filename = _filename;
    
    __hash    = undefined;
    __changed = true;
    
    __compiled = false;
    __function = undefined;
    
    static __Check = function()
    {
        var _found_hash = md5_file(__filename);
        if (_found_hash != __hash)
        {
            __hash = _found_hash;
            
            __CatspeakLiveTrace("Change detected in \"", __filename, "\"");
            
            __changed  = true;
            __compiled = false;
            __function = undefined;
            
            __Compile();
        }
    }
    
    static __IsChanged = function()
    {
        if (__changed)
        {
            __changed = false;
            return true;
        }
        
        return false;
    }
    
    static __Compile = function()
    {
        if (__compiled) return;
        
        __CatspeakLiveTrace("Compiling \"", __filename, "\"");
        
        try
        {
            var _buffer = buffer_load(__filename);
            var _string = (buffer_get_size(_buffer) <= 0)? "" : buffer_read(_buffer, buffer_text);
            buffer_delete(_buffer);
            
            var _environment = __global.__environment;
            
            var _timer = get_timer();
            var _asg = _environment.parseString(_string);
            __function = _environment.compileGML(_asg);
            
            __CatspeakLiveTrace("Compiled \"", __filename, "\" successfully (took ", (get_timer() - _timer)/1000, "ms)");
            
            __compiled = true;
        }
        catch(_error)
        {
            __CatspeakLiveTrace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            __CatspeakLiveTrace("Error encountered whilst compiling \"", __filename, "\"");
            __CatspeakLiveTrace(_error.message);
            __CatspeakLiveTrace(_error.stacktrace);
            __CatspeakLiveTrace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            
            __compiled = false;
            __function = undefined;
        }
    }
    
    static __Execute = function()
    {
        __Compile();
        return __function();
    }
}