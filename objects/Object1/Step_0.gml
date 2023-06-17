watcher.Check();

if (watcher.IsChanged())
{
    var _error = false;
    var _string = watcher.GetString();
    
    try
    {
        var _asg = env.parseString(_string);
    }
    catch(_errorStruct)
    {
        _error = true;
        show_debug_message("PARSER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        show_debug_message(_errorStruct.longMessage);
        show_debug_message("PARSER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
    
    if (not _error)
    {
        var _buffer = buffer_create(1024, buffer_grow, 1);
        SnapBufferWriteBinary(_buffer, _asg, false);
        buffer_save(_buffer, global.datafiles_dest + "test.catbin");
        buffer_delete(_buffer);
        
        try
        {
            func = env.compileGML(_asg);
        }
        catch(_errorStruct)
        {
            _error = true;
            show_debug_message("COMPILER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            show_debug_message(_errorStruct.longMessage);
            show_debug_message("COMPILER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }
    }
}