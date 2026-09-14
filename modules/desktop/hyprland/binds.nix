{username, ...}: {
  home-manager.users.${username}.wayland.windowManager.hyprland.extraConfig = ''
    local mainMod = "SUPER"

    hl.bind(mainMod .. " + RETURN",            hl.dsp.exec_cmd("kitty"))
    hl.bind(mainMod .. " + M",                 hl.dsp.exit())
    hl.bind(mainMod .. " + SHIFT + Q",         hl.dsp.window.close())
    hl.bind(mainMod .. " + R",                 hl.dsp.exec_cmd("pcmanfm"))
    hl.bind(mainMod .. " + F",                 hl.dsp.window.fullscreen())
    hl.bind(mainMod .. " + SHIFT + SPACE",     hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + D",                 hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
    hl.bind(mainMod .. " + P",                 hl.dsp.window.pin())
    hl.bind(mainMod .. " + J",                 hl.dsp.layout("togglesplit"))
    hl.bind(mainMod .. " + SHIFT + E",         hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
    hl.bind(mainMod .. " + SHIFT + P",         hl.dsp.exec_cmd("noctalia msg power-cycle"))
    hl.bind(mainMod .. " + V",                 hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
    hl.bind(mainMod .. " + COMMA",             hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
    hl.bind(mainMod .. " + ALT + L",           hl.dsp.exec_cmd("noctalia msg session lock"))
    hl.bind(mainMod .. " + equal",             hl.dsp.exec_cmd("hyprpicker -an"))
    hl.bind(mainMod .. " + N",                 hl.dsp.exec_cmd("noctalia msg panel-toggle control-center notifications"))
    hl.bind(mainMod .. " + S",                 hl.dsp.exec_cmd("noctalia msg screenshot-region"))
    hl.bind(mainMod .. " + SHIFT + S",         hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))
    hl.bind(mainMod .. " + SEMICOLON",         hl.dsp.exec_cmd("pkill wl-screenrec ;wl-screenrec -b 1MB -m 60 --encode-resolution 960x600 -f ~/Img/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"))
    hl.bind(mainMod .. " + SHIFT + SEMICOLON", hl.dsp.exec_cmd("pkill wl-screenrec"))

    hl.bind(mainMod .. " + ALT + left",  hl.dsp.exec_cmd("noctalia msg wallpaper-previous"))
    hl.bind(mainMod .. " + ALT + right", hl.dsp.exec_cmd("noctalia msg wallpaper-next"))

    hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left"  }))
    hl.bind(mainMod .. " + h",     hl.dsp.focus({ direction = "left"  }))
    hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + l",     hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up"    }))
    hl.bind(mainMod .. " + k",     hl.dsp.focus({ direction = "up"    }))
    hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down"  }))
    hl.bind(mainMod .. " + j",     hl.dsp.focus({ direction = "down"  }))

    hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "left"  }))
    hl.bind(mainMod .. " + SHIFT + h",     hl.dsp.window.swap({ direction = "left"  }))
    hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
    hl.bind(mainMod .. " + SHIFT + l",     hl.dsp.window.swap({ direction = "right" }))
    hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "up"    }))
    hl.bind(mainMod .. " + SHIFT + k",     hl.dsp.window.swap({ direction = "up"    }))
    hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "down"  }))
    hl.bind(mainMod .. " + SHIFT + j",     hl.dsp.window.swap({ direction = "down"  }))

    hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -60, y =   0 }), { repeating = true })
    hl.bind(mainMod .. " + CTRL + h",     hl.dsp.window.resize({ x = -60, y =   0 }), { repeating = true })
    hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x =  60, y =   0 }), { repeating = true })
    hl.bind(mainMod .. " + CTRL + l",     hl.dsp.window.resize({ x =  60, y =   0 }), { repeating = true })
    hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x =   0, y = -60 }), { repeating = true })
    hl.bind(mainMod .. " + CTRL + k",     hl.dsp.window.resize({ x =   0, y = -60 }), { repeating = true })
    hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x =   0, y =  60 }), { repeating = true })
    hl.bind(mainMod .. " + CTRL + j",     hl.dsp.window.resize({ x =   0, y =  60 }), { repeating = true })

    -- Switching workspaces & moving windows
    for i = 1, 10 do
      local key = i % 10
      hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
      hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
    end

    hl.bind(mainMod .. " + X",         hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = "special:magic" }))

    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("noctalia msg volume-up"),        { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("noctalia msg volume-down"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("noctalia msg volume-mute"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("noctalia msg mic-mute"),         { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("noctalia msg brightness-up"),    { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down"),  { locked = true, repeating = true })

    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("noctalia msg media next"),     { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("noctalia msg media toggle"),   { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("noctalia msg media toggle"),   { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("noctalia msg media previous"), { locked = true })
  '';
}
