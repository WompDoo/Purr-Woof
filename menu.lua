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

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "menu2", "fade", 500)
	return true	-- indicates successful touch
end

local function onQuitBtnRelease()
	
	-- go to level1.lua scene
	os.exit()
	
	return true	-- indicates successful touch
end

local function onMenuBtnRelease()
  
  -- go to level1.lua scene
  composer.gotoScene( "mainmenu", "fade", 500)
  return true -- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

  local background = functions.loadBackground()
  local titleLogo = functions.loadLogo(100)
	
	playBtn = functions.createButton("Play Now", onPlayBtnRelease)
	playBtn.x = display.contentCenterX
	playBtn.y = display.contentHeight - 300
	
	quitBtn = functions.createButton("Quit", onQuitBtnRelease)
	quitBtn.x = display.contentCenterX
	quitBtn.y = display.contentHeight - 240

  menuBtn = functions.createButton("Menu", onMenuBtnRelease)
  menuBtn.x = display.contentCenterX
  menuBtn.y = display.contentHeight - 80
  
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( playBtn )
	sceneGroup:insert( quitBtn)
	sceneGroup:insert( menuBtn)
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