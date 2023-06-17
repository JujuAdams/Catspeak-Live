function __CatspeakLiveGetPath(_name)
{
    return __CatspeakLiveDatafilesDirectory() + string_replace_all(_name, "\\", "/") + "." + CATSPEAK_LIVE_SOURCE_EXTENSION;
}