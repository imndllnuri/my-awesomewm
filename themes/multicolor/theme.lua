--[[

     Multicolor Awesome WM theme 2.0 (modified for white widgets)
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.wallpaper                                 = theme.confdir .. "/wallpaper.jpg"
theme.font                                      = "JetBrainsMono Nerd Font 10"
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#000000"
theme.prompt_bg                                 = "#0f0f0f1a"
theme.bg_focus                                  = "#ededed33"
theme.bg_urgent                                 = "#000000"
theme.bg_systray                                = "#0f0f0f1a"
theme.tasklist_bg_normal                        = "#0f0f0f1a"
theme.tasklist_fg_normal                        = "#ffffff"
theme.tasklist_bg_focus                         = "#ededed33"
theme.taglist_bg_focus                          = "#ededed33"
theme.fg_normal                                 = "#ffffff"      -- changed from #aaaaaa to white
theme.fg_focus                                  = "#EDEDED"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#222222"
theme.border_focus                              = "#ffffff"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#EDEDED"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 8
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup
local sep = markup.fontfg(theme.font, "#555555", "  ")

-- Textclock (with clock icon)
os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(
    markup("#ffffff", "\u{f017} %I:%M %p %Z  %A %d %B ")
)
mytextclock.font = theme.font

-- PDT clock (US Pacific time — shows PST instead in winter, when Pacific
-- isn't on daylight saving time; that's correct, not a bug)
local pdt_textclock = wibox.widget.textclock(
    markup("#aaaaaa", "\u{f017} %I:%M %p %Z ") .. sep,
    60,
    "America/Los_Angeles"
)
pdt_textclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Weather (commented, but if enabled you'd change colors to white)
--[[
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 2643743, -- placeholder (London)
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#ffffff", "N/A "), -- changed to white
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", descr .. " @ " .. units .. "°C ")) -- white
    end
})
--]]

-- / fs (commented, but if enabled)
--[[
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", string.format("%.1f", fs_now["/"].percentage) .. "% ")) -- white
    end
})
--]]

-- CPU
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", "\u{f2db}  " .. cpu_now.usage .. "% ") .. sep)
    end
})

-- Coretemp
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", "\u{f2c9}  " .. coretemp_now .. "°C ") .. sep)
    end
})

-- Battery (icon changes with charge level; shows a bolt while plugged in)
local bat = lain.widget.bat({
    settings = function()
        local icon = "\u{f240}  "
        if bat_now.perc ~= "N/A" then
            local p = tonumber(bat_now.perc) or 100
            if     p <= 15 then icon = "\u{f244}  "
            elseif p <= 40 then icon = "\u{f243}  "
            elseif p <= 65 then icon = "\u{f242}  "
            elseif p <= 90 then icon = "\u{f241}  "
            else                icon = "\u{f240}  " end
        end
        if bat_now.ac_status == 1 then
            icon = "\u{f0e7}  "
        end
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, icon .. perc .. " ") .. sep)
    end
})

-- Volume (via wpctl/PipeWire, not plain ALSA — this lets volume go above
-- 100% for quiet sources, which the old amixer-based setup could not do)
theme.volume = { widget = wibox.widget.textbox() }

function theme.volume.update()
    awful.spawn.easy_async_with_shell("wpctl get-volume @DEFAULT_AUDIO_SINK@", function(stdout)
        local level = tonumber(string.match(stdout, "Volume:%s*([%d%.]+)")) or 1.0
        local perc = string.format("%d", math.floor(level * 100 + 0.5))
        if string.match(stdout, "MUTED") then
            perc = perc .. "M"
        end
        theme.volume.widget:set_markup(markup.fontfg(theme.font, "#ffffff", "\u{f028}  " .. perc .. "% ") .. sep)
    end)
end

gears.timer({
    timeout   = 5,
    autostart = true,
    call_now  = true,
    callback  = theme.volume.update
})

-- Net (shows link status and the connected SSID/network name)
theme.net = lain.widget.net({
    iface   = {"enp0s31f6", "wlp0s20f3"},
    timeout = 5,
    settings = function()
        local up = false
        for _, dev in pairs(net_now.devices) do
            if dev.carrier == "1" then
                up = true
            end
        end

        local label
        if up then
            local ssid = io.popen("iwgetid -r"):read("*l")
            label = (ssid and ssid ~= "") and ("\u{f1eb}  " .. ssid .. " ") or "\u{f1eb}  up "
        else
            label = "\u{f1eb}  down "
        end

        widget:set_markup(markup.fontfg(theme.font, "#ffffff", label) .. sep)
    end
})

-- MEM
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#ffffff", "\u{f035b}  " .. mem_now.used .. "M ") .. sep)
    end
})

-- MPD
theme.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset = {
            text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
                   mpd_now.album, mpd_now.date, mpd_now.title)
        }

        local artist, title
        if mpd_now.state == "play" then
            artist = "\u{f001}  " .. mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
        elseif mpd_now.state == "pause" then
            artist = "\u{f001}  paused "
            title  = ""
        else
            artist = ""
            title  = ""
        end

        if artist == "" and title == "" then
            widget:set_markup("")
        else
            widget:set_markup(
                markup.fontfg(theme.font, "#ffffff", artist) ..
                markup.fontfg(theme.font, "#ffffff", title) ..
                sep
            )
        end
    end
})

-- Keyboard layout (EN/TR toggle; replaces ibus's own floating panel, which can't be
-- repositioned or styled reliably since AwesomeWM doesn't manage that window)
local lang_widget = wibox.widget.textbox()
local function update_lang_widget()
    awful.spawn.easy_async_with_shell("ibus engine", function(stdout)
        local engine = stdout:gsub("%s+$", "")
        local label = (engine == "xkb:tr::tur") and "TR" or "EN"
        lang_widget:set_markup(markup.fontfg(theme.font, "#ffffff", "  \u{f11c}  " .. label .. " ") .. sep)
    end)
end
gears.timer{ timeout = 2, autostart = true, call_now = true, callback = update_lang_widget }
lang_widget:buttons(my_table.join(
    awful.button({}, 1, function()
        awful.spawn.easy_async_with_shell("ibus engine", function(stdout)
            local engine = stdout:gsub("%s+$", "")
            local next_engine = (engine == "xkb:tr::tur") and "xkb:us::eng" or "xkb:tr::tur"
            awful.spawn.with_shell("ibus engine " .. next_engine)
            gears.timer.delayed_call(update_lang_widget)
        end)
    end)
))
theme.lang_widget = lang_widget

-- Settings (gear icon -> quick-launch menu for common settings tools)
local settings_menu = awful.menu({
    items = {
        { "Network",           function() awful.spawn("nm-connection-editor") end },
        { "Bluetooth",         function() awful.spawn("blueman-manager") end },
        { "Sound",             function() awful.spawn("pavucontrol") end },
        { "Displays",          function() awful.spawn("arandr") end },
        { "Settings Manager",  function() awful.spawn("xfce4-settings-manager") end },
        { "Edit Awesome config", string.format("%s -e %s %s", awful.util.terminal,
                                  os.getenv("EDITOR") or "nvim", awesome.conffile) },
        { "Restart Awesome",   awesome.restart },
        { "Restart Picom",     function() awful.spawn.with_shell(
                                  "systemctl --user restart app-picom@autostart.service") end },
    }
})

theme.settings_widget = wibox.widget.textbox()
theme.settings_widget:set_markup(markup.fontfg(theme.font, "#ffffff", "\u{f013}  "))
theme.settings_widget:buttons(my_table.join(
    awful.button({}, 1, function() settings_menu:toggle() end)
))

-- Notification bell: click opens a modern floating panel (DND toggle + list)
local naughty = require("naughty")
local notif_history = {}
local unread_count = 0
local notif_widget = wibox.widget.textbox()

local function update_notif_widget()
    local icon = naughty.is_suspended() and "\u{f1f6}" or "\u{f0f3}"
    local badge = unread_count > 0 and (" " .. unread_count) or ""
    notif_widget:set_markup(markup.fontfg(theme.font, "#ffffff", "  " .. icon .. badge .. " ") .. sep)
end
update_notif_widget()

-- Panel widgets
local notif_list_layout = wibox.layout.fixed.vertical()
notif_list_layout.spacing = dpi(8)

local dnd_icon = wibox.widget.textbox()
local function update_dnd_icon()
    if naughty.is_suspended() then
        dnd_icon:set_markup(markup.fontfg(theme.font, "#ff6d6d", "\u{f1f6}  Muted"))
    else
        dnd_icon:set_markup(markup.fontfg(theme.font, "#EDEDED", "\u{f0f3}  Active"))
    end
end
update_dnd_icon()

local clear_btn = wibox.widget.textbox()
clear_btn:set_markup(markup.fontfg(theme.font, "#888888", "Clear all"))

local notif_panel_title = wibox.widget.textbox()
notif_panel_title:set_markup(markup.fontfg(theme.font, "#ffffff", "<b>Notifications</b>"))

local function build_notif_entry(n)
    local title_tb = wibox.widget.textbox()
    title_tb:set_markup(markup.fontfg(theme.font, "#ffffff", "<b>" .. (n.title or "") .. "</b>"))

    local time_tb = wibox.widget.textbox()
    time_tb:set_markup(markup.fontfg(theme.font, "#EDEDED", n.time or ""))

    local text_tb = wibox.widget.textbox()
    text_tb:set_markup(markup.fontfg(theme.font, "#bbbbbb", n.text or ""))
    text_tb:set_wrap("word")

    return wibox.widget {
        {
            {
                { title_tb, time_tb, layout = wibox.layout.align.horizontal },
                text_tb,
                spacing = dpi(2),
                layout  = wibox.layout.fixed.vertical,
            },
            margins = dpi(9),
            widget  = wibox.container.margin,
        },
        bg     = "#1f1f1fee",
        shape  = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 8) end,
        widget = wibox.container.background,
    }
end

local notif_popup -- forward decl

local function update_notif_panel()
    notif_list_layout:reset()
    if #notif_history == 0 then
        local empty = wibox.widget.textbox()
        empty:set_markup(markup.fontfg(theme.font, "#888888", "No notifications"))
        notif_list_layout:add(wibox.container.margin(empty, dpi(4), 0, dpi(6), dpi(6)))
    else
        for _, n in ipairs(notif_history) do
            notif_list_layout:add(build_notif_entry(n))
        end
    end
    update_dnd_icon()
end

notif_popup = awful.popup {
    widget = {
        {
            {
                {
                    notif_panel_title,
                    { dnd_icon, clear_btn, spacing = dpi(14), layout = wibox.layout.fixed.horizontal },
                    layout = wibox.layout.align.horizontal,
                },
                margins = dpi(12),
                widget  = wibox.container.margin,
            },
            bg     = "#00000000",
            widget = wibox.container.background,
        },
        {
            notif_list_layout,
            margins = dpi(12),
            widget  = wibox.container.margin,
        },
        layout = wibox.layout.fixed.vertical,
    },
    ontop        = true,
    visible      = false,
    bg           = "#141414f0",
    fg           = "#ffffff",
    border_width = 1,
    border_color = "#333333",
    minimum_width  = dpi(320),
    maximum_width  = dpi(320),
    shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 12) end,
}

local function close_notif_panel()
    notif_popup.visible = false
end

local function open_notif_panel()
    update_notif_panel()
    unread_count = 0
    update_notif_widget()
    local scr = mouse.screen
    local panel_w = dpi(320)
    notif_popup.x = scr.geometry.x + scr.geometry.width - panel_w - dpi(16)
    notif_popup.y = scr.geometry.y + dpi(50)
    notif_popup.visible = true
end

local function toggle_notif_panel()
    if notif_popup.visible then
        close_notif_panel()
    else
        open_notif_panel()
    end
end

local function dnd_click()
    naughty.toggle()
    update_dnd_icon()
    update_notif_widget()
end
dnd_icon:buttons(my_table.join(awful.button({}, 1, dnd_click)))

clear_btn:buttons(my_table.join(
    awful.button({}, 1, function()
        notif_history = {}
        update_notif_panel()
    end)
))

local original_notify = naughty.notify
naughty.notify = function(args)
    local is_calendar_popup = args and theme.cal and args.preset == theme.cal.notification_preset
    if args and (args.title or args.text) and not is_calendar_popup then
        table.insert(notif_history, 1, {
            title = args.title or "Notification",
            text  = args.text or "",
            time  = os.date("%H:%M"),
        })
        while #notif_history > 8 do table.remove(notif_history) end
        unread_count = unread_count + 1
        update_notif_widget()
        if notif_popup.visible then update_notif_panel() end
    end
    return original_notify(args)
end

notif_widget:buttons(my_table.join(
    awful.button({}, 1, toggle_notif_panel)
))
theme.notif_widget = notif_widget

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox: single floating bar, rounded corners, margin from screen edges
    local bar_margin = dpi(8)
    s.mywibox = awful.wibar({
        position     = "top",
        screen       = s,
        height       = dpi(38),
        bg           = "#0f0f0f1a",
        fg           = theme.fg_normal,
        border_width = dpi(1),
        border_color = "#333333",
        shape        = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 12) end,
    })

    local place_bar = awful.placement.top + awful.placement.maximize_horizontally
    local function apply_bar_placement()
        place_bar(s.mywibox, {
            margins = { top = bar_margin, left = bar_margin, right = bar_margin },
            attach  = true,
        })
    end
    apply_bar_placement()
    gears.timer.delayed_call(apply_bar_placement)

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
            theme.mpd.widget,
        },
        wibox.container.margin(s.mytasklist, 0, dpi(14), 0, 0), -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            theme.lang_widget,
            theme.net.widget,
            theme.volume.widget,
            memory.widget,
            cpu.widget,
            temp.widget,
            bat.widget,
            pdt_textclock,
            mytextclock,
            theme.notif_widget,
            theme.settings_widget,
        },
    }
end

return theme
