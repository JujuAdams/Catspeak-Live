global.datafiles_dest = filename_dir(GM_project_filename) + "/datafiles/";

function FileWatcher(_filename) constructor
{
    __filename = global.datafiles_dest + _filename;
    
    __hash    = undefined;
    __changed = true;
    
    static Check = function()
    {
        var _found_hash = md5_file(__filename);
        if (_found_hash != __hash)
        {
            __hash = _found_hash;
            __changed = true;
        }
    }
    
    static IsChanged = function()
    {
        if (__changed)
        {
            __changed = false;
            return true;
        }
        
        return false;
    }
    
    static GetString = function()
    {
        var _buffer = buffer_load(__filename);
        
        if (buffer_get_size(_buffer) > 0)
        {
            var _string = buffer_read(_buffer, buffer_text);
        }
        else
        {
            var _string = "";
        }
        
        buffer_delete(_buffer);
        return _string;
    }
}