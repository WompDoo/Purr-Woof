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
	
	composer.hideOverlay("slideUp", 400)
	infoBtn.isVisible = true
	
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	local nameoptions = 
    {
        text = event.params.forAnimal["name"],
        x = display.contentCenterX,
        y = 170,
        width = display.contentWidth * 0.65,
        font = "dogfont.ttf",
        fontSize = 36
    }
  local name = display.newText( nameoptions )
  name:setFillColor(0, 0, 0)
  
	local descriptionoptions = 
    {
        text = event.params.forAnimal["description"],
        x = display.contentCenterX,
        y = 210,
        width = display.contentWidth * 0.65,
        font = "dogfont.ttf",
        fontSize = 24
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
		closeBtn.y = 275

  infobackground = display.newImageRect( "pictures/infobckgr.png", 264, 240 )
  infobackground.x = display.contentCenterX
  infobackground.y = 200
  
	sceneGroup:insert ( infobackground )
	sceneGroup:insert( closeBtn )
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