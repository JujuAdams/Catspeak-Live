function __CatspeakLiveDatafilesDirectory()
{
    static _result = string_replace_all(filename_dir(GM_project_filename) + "/datafiles/", "\\", "/");
    return _result;
}