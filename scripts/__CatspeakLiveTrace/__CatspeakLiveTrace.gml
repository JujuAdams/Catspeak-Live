function __CatspeakLiveTrace()
{
    var _string = "CatspeakLive: ";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
}