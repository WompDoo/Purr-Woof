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
local items = require ("utils.items")
local myData = require("utils.saveddata")
--------------------------------------------

local function onCatBtnRelease()
  refreshScrollView("cat")
  return true -- indicates successful touch
end  

local function onFoodBtnRelease()
  refreshScrollView("food")
  return true -- indicates successful touch
end  

local function onToysBtnRelease()
  refreshScrollView("toy")
  return true -- indicates successful touch
end  

local function onDogBtnRelease()
  refreshScrollView("dog")  
  return true -- indicates successful touch
end  

local function onAllBtnRelease()
  refreshScrollView("all")  
  return true -- indicates successful touch
end  

local function onBackBtnRelease()
  composer.gotoScene("mainmenu") 
  composer.removeScene("shop")  
  return true -- indicates successful touch
end  

local function onItemBtnRelease(item)
  message = "Do you want to buy " .. item["name"] .. "?"
  local function onChosenComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
          -- just dismiss this
        elseif ( i == 2 ) then
          if myData.availableMoney >= item.price then 
            myData.availableMoney = myData.availableMoney - item.price
            moneycounter:setLabel(myData.availableMoney)
            table.insert(myData.purchasedItems, item)
          else
            native.showAlert( "Nope!", "You don't have enough money!", { "Whoops!" })
          end
        end
    end
  end 

  native.showAlert( "Purrchase confirmation", message, { "No", "Yes" }, onChosenComplete)
end

local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then 
    
    elseif ( phase == "moved" ) then -- Check if you moved your finger while touching
    
    elseif ( phase == "ended" ) then 
    
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then
    
        elseif ( event.direction == "down" ) then
    
        end
    end

    return true
end

function onButtonTouch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "moved" ) then
    	local dy = math.abs(event.y - event.yStart)

    	if dy > 5 then
    		scrollView:takeFocus(event)
    	end
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
    return true
end

function loadScrollView (filter)
  local scrollView = widget.newScrollView(
    {
      backgroundColor = { 0.0, 0.0, 0.0, 0},
      horizontalScrollDisabled = true,
        top = 52,
        --scrollWidth = 600,
        --scrollHeight = 490,
        listener = scrollListener
    }
  )

  local levelButton = {}
  local positionX = display.contentWidth - 170
  local positionY = display.contentHeight - 410
  local useditems = 0
  for i=1, #items do
    if (items[i]["type"][filter]) or (filter == "all") then 
      levelButton[i] = functions.createButtonShopItem(items[i], onItemBtnRelease)
      levelButton[i].x = positionX
      levelButton[i].y = positionY
      levelButton[i]["image"] = display.newImageRect(items[i]["image"], 50, 50 )
      levelButton[i]["image"].x = positionX 
      levelButton[i]["image"].y = positionY - 20
      levelButton[i]["coin"] = display.newImageRect("pictures/coin.png", 40, 40 )
      levelButton[i]["coin"].x = positionX + 25
      levelButton[i]["coin"].y = positionY + 10
      local priceoptions = 
      {
        text = items[i]["price"],
        x = levelButton[i]["coin"].x,
        y = levelButton[i]["coin"].y,
        font = "dogfont.ttf",
        fontSize = 24
      }
      levelButton[i]["price"] = display.newText( priceoptions )
      levelButton[i]["price"]:setFillColor(0, 0, 0)
      useditems = useditems + 1
      if (useditems % 2 == 0) then
        positionX = display.contentWidth - 170
        positionY = positionY + 120
      else
        positionX = display.contentWidth - 60
      end
      scrollView:insert( levelButton[i] )
      scrollView:insert( levelButton[i]["image"] )
      scrollView:insert( levelButton[i]["coin"] )
      scrollView:insert( levelButton[i]["price"] )
    end
  end
  return scrollView
end

function refreshScrollView(filter)
  local sceneGroup = scene.view
  scrollView:removeSelf()
  scrollView = nil
  scrollView = loadScrollView (filter)
  sceneGroup:insert( scrollView )
  catBtn:toFront()
  dogBtn:toFront()
  foodBtn:toFront()
  toysBtn:toFront()
  allBtn:toFront()
  backBtn:toFront()
end
  
function scene:create( event )

	local sceneGroup = self.view

	local background = functions.loadBackground()
	local titleLogo = functions.loadLogo(5)

  moneycounter = widget.newButton{
    defaultFile="pictures/coin.png",
    label=myData.availableMoney,
    labelColor = { default={black}, over={black} },
    font = "dogfont.ttf",
    fontSize = 28,
    width=60, height=60
  }
  moneycounter.x = display.actualContentWidth - (moneycounter.width*0.5)
  moneycounter.y = 10

  backBtn = functions.createButtonBack(onBackBtnRelease)
  		 	
  catBtn = functions.createButtonShop("Cat", onCatBtnRelease)
  catBtn.x = display.contentWidth - 290
  catBtn.y = display.contentHeight - 400

  dogBtn = functions.createButtonShop("Dog", onDogBtnRelease)
  dogBtn.x = display.contentWidth - 290
  dogBtn.y = display.contentHeight - 330
  
  foodBtn = functions.createButtonShop("Food", onFoodBtnRelease)
  foodBtn.x = display.contentWidth - 290
  foodBtn.y = display.contentHeight - 260
  
  toysBtn = functions.createButtonShop("Toys", onToysBtnRelease)
  toysBtn.x = display.contentWidth - 290
  toysBtn.y = display.contentHeight - 190
  
  allBtn = functions.createButtonShop("All", onAllBtnRelease)
  allBtn.x = display.contentWidth - 290
  allBtn.y = display.contentHeight - 120
      
  scrollView = loadScrollView ("all")
  
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert (moneycounter)
	sceneGroup:insert( scrollView )
	sceneGroup:insert( catBtn )
	sceneGroup:insert( dogBtn )
	sceneGroup:insert( foodBtn )
	sceneGroup:insert( toysBtn )
	sceneGroup:insert( allBtn )
	sceneGroup:insert( backBtn )
	

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