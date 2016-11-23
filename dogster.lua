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
local animals = require ("utils.animals")
--------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onHotBtnRelease()
  message = "You chose " .. animals[nextdog][1] .. "!"
	native.showAlert( "Chosen Dog", message )
	-- go to level1.lua scene
	--composer.gotoScene( "menu2", "fade", 500)
	--return true	-- indicates successful touch
end

local function onNotBtnRelease()
  nextdog = next(animals,nextdog)
  dog:removeSelf()
  dog = nil
  if not nextdog then
    dog = functions.displayAnimal ("pictures/Xfullred.png")
  else 
    dog = functions.displayAnimal( animals[nextdog][2] )
  end
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "pictures/background.png", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "pictures/logo.png", 264, 42 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 25
	
	nextdog = 1
	dog = functions.displayAnimal( animals[nextdog][2] )
	
	-- create a widget button (which will loads level1.lua on release)
	notBtn = widget.newButton{
		--label="Play Now",
		--labelColor = { default={black}, over={128} },
		defaultFile="pictures/Xfullred.png",
		--over="button-over.png",
		width=110, height=90,
		onRelease = onNotBtnRelease	-- event listener function
	}
	notBtn.x = 90
	notBtn.y = 450

	

	--myRectangle = display.newRect(158,175,124,30)
	--myRectangle.strokeWidth = 3
	--myRectangle:setFillColor( 0.5 )
	--myRectangle:setStrokeColor( 1, 0, 0 )
	
	quitBtn = widget.newButton{
		--label="Quit",
		--labelColor = { default={black}, over={128} },
		defaultFile="pictures/syda.png",
		--over="button-over.png",
		width=123, height=117,
		onRelease = onHotBtnRelease	-- event listener function
	}
	quitBtn.x = 235
	quitBtn.y = 450
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( notBtn )
	sceneGroup:insert( quitBtn )
	sceneGroup:insert( dog )
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