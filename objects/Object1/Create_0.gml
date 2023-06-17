func = function() {}

env = new CatspeakEnvironment();

env.addFunction(
    "draw_circle", draw_circle,
    "draw_text", draw_text,
    "mouse_get_x", function () { return mouse_x },
    "mouse_get_y", function () { return mouse_y },
);

env.applyPreset(CatspeakPreset.COLOUR);

watcher = new FileWatcher("test.catscr");