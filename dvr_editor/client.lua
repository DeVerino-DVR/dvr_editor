_rockstarPool = NativeUI.CreatePool()
rockstarMenu = NativeUI.CreateMenu("","~b~Rockstar Editor", 0, 0,"new_editor","r_editor_header",nil,255,255,255,255)
_rockstarPool:Add(rockstarMenu)

AddEditorMenu = function(menu)
    
    local rec = NativeUI.CreateItem("Record", "")
    local save = NativeUI.CreateItem("Sauvegarder", "")
    local open = NativeUI.CreateItem("Ouvrir Rockstar editor", "")
    menu:AddItem({rec, save, open})

	menu.OnItemSelect = function(_, item, _)

        if item == rec then
            StartRecording(1)
        elseif item == save then
            StopRecordingAndSaveClip()
        elseif item == open then
            NetworkSessionLeaveSinglePlayer()
            ActivateRockstarEditor()
        end
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 344) then
            rockstarMenu:Visible(true)
        end
    end
end)

AddEditorMenu(rockstarMenu)
_rockstarPool:RefreshIndex()
_rockstarPool:WidthOffset(80)
_rockstarPool:MouseControlsEnabled (false)
_rockstarPool:MouseEdgeEnabled (false)
_rockstarPool:ControlDisablingEnabled(false)
_rockstarPool:DisableInstructionalButtons(false)
