-----------------------------------------------------------------------------------------
--
-- mainmenu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"
local functions = require ("utils.functions")
--------------------------------------------

local function onYardBtnRelease()
	composer.gotoScene( "yard", "fade", 500)
	return true	-- indicates successful touch
end

local function onShopBtnRelease()
  composer.gotoScene( "shop", "fade", 500)
  return true -- indicates successful touch
end

local function onGamesBtnRelease()
  composer.gotoScene( "games", "fade", 500)
  return true -- indicates successful touch
end

local function onCameraBtnRelease()
  composer.gotoScene( "camera", "fade", 500)
  return true -- indicates successful touch
end

local function onTubBtnRelease()
  composer.gotoScene( "tub", "fade", 500)
  return true -- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect( "pictures/background.png", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
		
	yardBtn = functions.createButtonShop("Cat", onYardBtnRelease)
	yardBtn.x = display.contentWidth - 290
	yardBtn.y = display.contentHeight - 450

  shopBtn = functions.createButtonShop("Dog", onShopBtnRelease)
  shopBtn.x = display.contentWidth - 290
  shopBtn.y = display.contentHeight - 400
  
  gamesBtn = functions.createButtonShop("Food", onGamesBtnRelease)
  gamesBtn.x = display.contentWidth - 290
  gamesBtn.y = display.contentHeight - 350
  
  cameraBtn = functions.createButtonShop("Toys", onCameraBtnRelease)
  cameraBtn.x = display.contentWidth - 290
  cameraBtn.y = display.contentHeight - 300

  cameraBtn = functions.createButtonShopItem("Item 1", onCameraBtnRelease)
  cameraBtn.x = display.contentWidth - 200
  cameraBtn.y = display.contentHeight - 450

  
	sceneGroup:insert( background )
	sceneGroup:insert( yardBtn )
	sceneGroup:insert( shopBtn )
	sceneGroup:insert( gamesBtn )
	sceneGroup:insert( cameraBtn )
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