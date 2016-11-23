-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"
local functions = require ("utils.functions")
--------------------------------------------

local function oncloseBtnRelease()
	
	composer.hideOverlay("fade", 400)
	infoBtn.isVisible = true
	closeBtn.isVisible = false
	
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	local nameoptions = 
    {
        text = event.params.animal["name"],
        x = display.contentCenterX,
        y = 100,
        width = display.contentWidth * 0.8,
        font = native.systemFont,
        fontSize = 24
    }
  local name = display.newText( nameoptions )
  name:setFillColor(0, 0, 0)
  
	local descriptionoptions = 
    {
        text = event.params.animal["description"],
        x = display.contentCenterX,
        y = 150,
        width = display.contentWidth * 0.8,
        font = native.systemFont,
        fontSize = 16
    }
	local description = display.newText( descriptionoptions )
	description:setFillColor(0, 0, 0)

		closeBtn = widget.newButton{
		--label="X",
		--labelColor = { default={black}, over={128} },
		defaultFile="pictures/Xfullred.png",
		--overFile="button-over.png",
		width=50, height=50,
		onRelease = oncloseBtnRelease	-- event listener function
	}
		
		closeBtn.x = display.contentCenterX
		closeBtn.y = 292

  local background = functions.loadBackground()

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( name )
	sceneGroup:insert( description )
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene