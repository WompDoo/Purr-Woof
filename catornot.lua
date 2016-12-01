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
local cats = animals["cats"]
local myData = require( "utils.saveddata" )
--------------------------------------------

local function onInfoBtnRelease()
  local infooptions =
  {
    isModal = true,
    effect = "slideDown",
    params = {
        animal = cats[nextcat]
    }
  }
  composer.showOverlay("info", infooptions)
  
  infoBtn.isVisible = false
  
  return true -- indicates successful touch
end  

local function onHotBtnRelease()
  message = "Are you sure you want " .. cats[nextcat]["name"] .. "?"
  
  local function onChosenComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
          -- just dismiss this
        elseif ( i == 2 ) then
        	myData.chosenAnimal = cats[nextcat]
        	composer.gotoScene( "mainmenu" )
        	composer.removeScene( "catornot" )
        end
    end
  end

  native.showAlert( "Chosen Cat", message, { "Actually...", "Sure!" }, onChosenComplete)
  
  return true
end

local function onNotBtnRelease()
  local sceneGroup = scene.view
  
  nextcat = next(cats,nextcat)
  cat:removeSelf()
  cat = nil
  if not nextcat then
    local ranouttext = 
    {
        text = "You're out of cats!\nDon't you want to see dogs instead?",
        x = display.contentCenterX,
        y = 220,
        width = display.contentWidth * 0.8,
        font = "dogfont.ttf",
        fontSize = 28
    }
    cat = display.newText( ranouttext )
    cat:setFillColor( black )
    sceneGroup:insert( cat )
    backBtn.isVisible = true
    dogBtn.isVisible = true
    hotBtn:removeSelf()
    notBtn:removeSelf()
    infoBtn:removeSelf()
  else 
    cat = functions.displayAnimal( cats[nextcat]["image"] )
    sceneGroup:insert( cat )
    infoBtn:toFront()
  end
  return true -- indicates successful touch
end

local function onBackBtnRelease()
  composer.gotoScene( "mainmenu" )
  composer.removeScene( "catornot" )
  return true -- indicates successful touch
end

local function onDogBtnRelease()
  composer.gotoScene( "dogster" )
  composer.removeScene( "catornot" )
  return true -- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

  local background = functions.loadBackground()
  local titleLogo = functions.loadLogo(25, "catornot")
	
	nextcat = 1
  cat = functions.displayAnimal( cats[nextcat]["image"] )
 
 	notBtn = widget.newButton{
		defaultFile="pictures/Xfullred.png",
		width=110, height=90,
		onRelease = onNotBtnRelease	-- event listener function
	}
	notBtn.x = 90
	notBtn.y = 450

	infoBtn = widget.newButton{
		defaultFile="pictures/info.png",
		width=40, height=40,
		onRelease = onInfoBtnRelease
	}
	infoBtn.x = 265
	infoBtn.y = 106

	hotBtn = widget.newButton{
		defaultFile="pictures/syda.png",
		width=123, height=117,
		onRelease = onHotBtnRelease	-- event listener function
	}
	hotBtn.x = 235
	hotBtn.y = 450
	
	backBtn = functions.createButton("Go back", onBackBtnRelease)
  backBtn.x = 90
  backBtn.y = 450
  backBtn.isVisible = false

  dogBtn = functions.createButton("See dogs", onDogBtnRelease)
  dogBtn.x = 235
  dogBtn.y = 450
  dogBtn.isVisible = false
	
	sceneGroup:insert( background )
  sceneGroup:insert( titleLogo )
  sceneGroup:insert( notBtn )
  sceneGroup:insert( hotBtn )
  sceneGroup:insert( backBtn )
  sceneGroup:insert( dogBtn )
  sceneGroup:insert( cat )
  sceneGroup:insert( infoBtn )
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

return scene



