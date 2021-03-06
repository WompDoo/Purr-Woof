-----------------------------------------------------------------------------------------
--
-- menu2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"
local functions = require ("utils.functions")
--------------------------------------------




-- forward declarations and other locals
-- local pBtn

-- 'onRelease' event listener for playBtn
local function onDogBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "dogster", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function onCatBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "catornot", "fade", 500 )
	
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

  local background = functions.loadBackground()
  local titleLogo = functions.loadLogo(100)
  	
	-- create a widget button (which will loads level1.lua on release)
	dogBtn = functions.createButton("dog person", onDogBtnRelease)
	dogBtn.x = display.contentCenterX
	dogBtn.y = display.contentHeight - 270

	text1 = display.newText( "Are you a", display.contentCenterX, 165,  native.systemFont, 26)	
	text1:setFillColor( 0, 0, 0 )
	
	text2 = display.newText( "or a", display.contentCenterX, 255,  native.systemFont, 26 )
	text2:setFillColor( 0, 0, 0 )
	

	catBtn = functions.createButton("cat person", onCatBtnRelease)
	catBtn.x = display.contentCenterX
	catBtn.y = display.contentHeight - 180
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( text1 )
	sceneGroup:insert( text2 )
	sceneGroup:insert( dogBtn )
	sceneGroup:insert( catBtn)
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
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene