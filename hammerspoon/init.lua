-- autoreload
-------------
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")


-- window management
--------------------
hs.hints.style = "vimperator"
hs.hotkey.bind({"ctrl"}, "Tab", hs.hints.windowHints)

window_switcher = hs.window.switcher.new(
    hs.window.filter.new():setDefaultFilter({})
)

function switchCurrentAppWindows(direction)
    current_app = hs.application.frontmostApplication()
    app_window_switcher = hs.window.switcher.new({current_app:name()})
    if direction == '>' then
	app_window_switcher:next()
    elseif direction == '<' then
	app_window_switcher:previous()
    end
end

hs.hotkey.bind({"alt"}, "Tab", window_switcher.nextWindow)
hs.hotkey.bind({"shift", "alt"}, "Tab", window_switcher.previousWindow)
hs.hotkey.bind({"alt"}, "§", function() switchCurrentAppWindows('>') end)
hs.hotkey.bind({"shift", "alt"}, "§", function() switchCurrentAppWindows('<') end)

function isMaxed(win)
    local f = win:frame()
    local max = win:screen():frame()
    local tol = 10
    return f.x == max.x and f.y == max.y and f.w >= (max.w - tol) and f.h >= (max.h - tol)
end

function setSizeRelativeToScreen(window, wf, hf)
    local f = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * wf / 2)
    f.y = max.y + (max.h * hf / 2)
    f.w = max.w * wf
    f.h = max.h * hf
end

hs.hotkey.bind({"alt"}, "Z", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    if not isMaxed(win) then
        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
    else
        f.x = max.x + max.w/4
        f.y = max.y + max.h/4
        f.w = max.w/2
        f.h = max.h/2
    end
    win:setFrame(f)
end)

hs.hotkey.bind({"alt"}, "N", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen():next()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

-- VPN connect/disconnect
-------------------------
hs.hotkey.bind({"alt"}, "V", function()
    local output, status, t, r = hs.execute('scutil --nc show "VPN (ETH)" | grep Disconnected > /dev/null')
    if status then
        hs.execute('scutil --nc start "VPN (ETH)"')
        hs.alert.show('Connecting VPN: ETH')
    else
        hs.execute('scutil --nc stop "VPN (ETH)"')
        hs.alert.show('Disonnecting VPN: ETH')
    end
    --hs.execute("scutil --nc
end)

-- Audio Device switcher
------------------------
function getBuiltinOutputDevice()
    return hs.audiodevice.findOutputByName('Built-in Output')
end

function getScarlettOutputDevice()
    return hs.audiodevice.findOutputByName('Scarlett Solo USB')
end

hs.hotkey.bind({"command"}, "F1", function()
    local builtin = getBuiltinOutputDevice()
    local scarlett = getScarlettOutputDevice()
    if hs.audiodevice.defaultOutputDevice() == builtin then
        scarlett:setDefaultOutputDevice()
    else
        builtin:setDefaultOutputDevice()
    end
    hs.alert.show("Output Device: " .. hs.audiodevice.defaultOutputDevice():name())
end)

-- App Shortcuts
----------------
function toggleApplication(bundle_id)
    local app = hs.application.get(bundle_id)
    if app and app:isFrontmost() then
        --hs.alert.show(string.format('%s is frontmost, hiding', app:name()))
        app:hide()
    else
        hs.application.launchOrFocusByBundleID(bundle_id)
    end
end

hs.hotkey.bind({"command"}, "F2", function()
    toggleApplication('com.googlecode.iterm2')
end)

hs.hotkey.bind({"command"}, "F3", function()
    toggleApplication('com.qvacua.VimR')
end)
