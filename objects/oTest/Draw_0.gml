draw_text(10, 10, "exists = " + string(CatspeakLiveExists("test")));

if (CatspeakLiveExists("test"))
{
    CatspeakLiveExecute("test");
}