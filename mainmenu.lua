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
local myData = require( "utils.saveddata" )
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

local function onRoomBtnRelease()
  composer.gotoScene( "room", "fade", 500)
  return true -- indicates successful touch
end

local function onChooseBtnRelease()
  composer.gotoScene( "menu2", "fade", 500)
  composer.removeScene("mainmenu")
  return true -- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

  local background = functions.loadBackground()
  local titleLogo = functions.loadLogo(50)
  
  local nameoptions = 
      {
          x = display.contentCenterX,
          y = display.contentHeight - 65,
          width = display.contentWidth * 0.8,
          font = "dogfont.ttf",
          fontSize = 24
      }
      
  if myData.chosenAnimal then
    nameoptions["text"] = "Your animal is " .. myData.chosenAnimal["name"] .. "!"
  else
    nameoptions["text"] = "You haven't chosen an animal yet!"  
  end 
  
  local name = display.newText( nameoptions )
  name:setFillColor(0, 0, 0)
	
	yardBtn = functions.createButton("Yard", onYardBtnRelease)
	yardBtn.x = display.contentCenterX
	yardBtn.y = display.contentHeight - 350

  shopBtn = functions.createButton("Shop", onShopBtnRelease)
  shopBtn.x = display.contentCenterX
  shopBtn.y = display.contentHeight - 290
  
  gamesBtn = functions.createButton("Games", onGamesBtnRelease)
  gamesBtn.x = display.contentCenterX
  gamesBtn.y = display.contentHeight - 230
  
  cameraBtn = functions.createButton("Camera", onCameraBtnRelease)
  cameraBtn.x = display.contentCenterX
  cameraBtn.y = display.contentHeight - 170
  
  roomBtn = functions.createButton("Room", onRoomBtnRelease)
  roomBtn.x = display.contentCenterX
  roomBtn.y = display.contentHeight - 110
  
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( roomBtn )
	sceneGroup:insert( yardBtn )
	sceneGroup:insert( shopBtn )
	sceneGroup:insert( gamesBtn )
	sceneGroup:insert( cameraBtn )
	sceneGroup:insert( name )
	
	if not myData.chosenAnimal then
  	chooseBtn = functions.createButton("Choose!", onChooseBtnRelease)
    chooseBtn.x = display.contentCenterX
    chooseBtn.y = display.contentHeight - 20
	  sceneGroup:insert( chooseBtn )
	end
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