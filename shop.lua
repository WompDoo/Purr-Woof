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

local function onItemBtnRelease()
  message = "Do You want to buy this?"
  local function onChosenComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
          -- just dismiss this
        elseif ( i == 2 ) then
          --add something to do with yes
        end
    end
  end 

  native.showAlert( "Purrchase confirmation", message, { "No", "Yes" }, onChosenComplete)


end

function scene:create( event )
	local sceneGroup = self.view

	local background = functions.loadBackground()
	local titleLogo = functions.loadLogo(5)
		
  catBtn = functions.createButtonShop("Cat", onYardBtnRelease)
  catBtn.x = display.contentWidth - 290
  catBtn.y = display.contentHeight - 400

  dogBtn = functions.createButtonShop("Dog", onShopBtnRelease)
  dogBtn.x = display.contentWidth - 290
  dogBtn.y = display.contentHeight - 330
  
  foodBtn = functions.createButtonShop("Food", onGamesBtnRelease)
  foodBtn.x = display.contentWidth - 290
  foodBtn.y = display.contentHeight - 260
  
  toysBtn = functions.createButtonShop("Toys", onCameraBtnRelease)
  toysBtn.x = display.contentWidth - 290
  toysBtn.y = display.contentHeight - 190

  item1Btn = functions.createButtonShopItem("999", onItemBtnRelease)
  item1Btn.x = display.contentWidth - 170
  item1Btn.y = display.contentHeight - 370

  item2Btn = functions.createButtonShopItem("999", onItemBtnRelease)
  item2Btn.x = display.contentWidth - 60
  item2Btn.y = display.contentHeight - 370
	
  item3Btn = functions.createButtonShopItem("999", onItemBtnRelease)
  item3Btn.x = display.contentWidth - 170
  item3Btn.y = display.contentHeight - 240

  item4Btn = functions.createButtonShopItem("999", onItemBtnRelease)
  item4Btn.x = display.contentWidth - 60
  item4Btn.y = display.contentHeight - 240

  item5Btn = functions.createButtonShopItem("999", onItemBtnRelease)
  item5Btn.x = display.contentWidth - 170
  item5Btn.y = display.contentHeight - 120
  
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( catBtn )
	sceneGroup:insert( dogBtn )
	sceneGroup:insert( foodBtn )
	sceneGroup:insert( toysBtn )
	sceneGroup:insert( item1Btn )
	sceneGroup:insert( item2Btn )
	sceneGroup:insert( item3Btn )
	sceneGroup:insert( item4Btn )
	sceneGroup:insert( item5Btn )

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