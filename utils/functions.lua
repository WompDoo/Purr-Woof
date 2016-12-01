local widget = require "widget"
local composer = require( "composer" )

local functionbag = {}

local function createButton(labeltext, functionname)
  return widget.newButton{
    label=labeltext,
    labelColor = { default={black}, over={128} },
    defaultFile="pictures/button3.png",
    font = "dogfont.ttf",
    fontSize = 28,
    width=154, height=65,
    onRelease = functionname  -- event listener function
  }
end

local function createButtonBack()
  local button = widget.newButton{
    label="☰",
    labelColor = { default={black}, over={black} },
    width=60, height=60,
    fontSize = 30,
    onRelease = function() return composer.gotoScene( "mainmenu" ) end
  }
  button.x = (button.width*0.5)
  button.y = 10
  return button
end
  
local function createButtonShop(labeltext, functionname)
  return widget.newButton{
    label=labeltext,
    labelColor = { default={black}, over={128} },
    defaultFile="pictures/tab.png",
    font = "dogfont.ttf",
    fontSize = 28,
    width=120, height=60,
    onRelease = functionname  -- event listener function
  }
end

local function createButtonShopItem(item, functionname)
  button = widget.newButton{
    label=item["name"],
    labelColor = { default={black}, over={black} },
    defaultFile="pictures/item.png",
    width=130, height=120,
    font = "dogfont.ttf",
    fontSize = 24,
    labelYOffset = 33,
    onRelease = function() return functionname(item) end -- event listener function
  }
  button:addEventListener("touch", onButtonTouch)
  return button
end

local function displayAnimal(image)
  animal = display.newImageRect( image, 280, 290 )
  animal.x = display.contentCenterX
  animal.y = 220
  return animal
end

local function loadBackground()
  background = display.newImageRect( "pictures/background.png", display.actualContentWidth, display.actualContentHeight )
  background.anchorX = 0
  background.anchorY = 0
  background.x = 0 + display.screenOriginX 
  background.y = 0 + display.screenOriginY
  return background
end

local function loadYardBackground()
  month = os.date("%m")
  if (month == "3") or (month == "4") or (month == "5") then
    backimage = "pictures/yard/spring.png"
  elseif (month == "6") or (month == "7") or (month == "8") then
    backimage = "pictures/yard/summer.png"
  elseif (month == "9") or (month == "10") or (month == "11") then
    backimage = "pictures/yard/autumn.png"
  else
    backimage = "pictures/yard/winter.png"
  end
  background = display.newImageRect( backimage, display.actualContentWidth, display.actualContentHeight )
  background.anchorX = 0
  background.anchorY = 0
  background.x = 0 + display.screenOriginX 
  background.y = 0 + display.screenOriginY
  return background
end

local function loadLogo(y, type)
  if (type == "dogster") then 
    picture = "pictures/logos/dogster.png"
  elseif (type == "catornot") then  
    picture = "pictures/logos/catornot.png"
  else
    picture = "pictures/logos/mainlogo.png"
  end
  titleLogo = display.newImageRect( picture, 264, 42 )
  titleLogo.x = display.contentCenterX
  titleLogo.y = y
  return titleLogo
end

local function displayAnimal(image)
  animal = display.newImageRect(image, 280, 290)
  animal.x = display.contentCenterX
  animal.y = 220
  return animal
end

local function animateAnimal(image)
  local sheetOptions =
  {
    width = 512,
    height = 256,
    numFrames = 4
  }
  local imageSheet = graphics.newImageSheet( image, sheetOptions )
  local sequencesAnimation = {
    -- consecutive frames sequence
    {
        name = "animation",
        start = 1,
        count = 4,
        time = 1500,
        loopCount = 0,
        loopDirection = "forward"
    }
  }
  return display.newSprite( imageSheet, sequencesAnimation )
end

functionbag.createButton = createButton
functionbag.createButtonShop = createButtonShop
functionbag.createButtonShopItem = createButtonShopItem
functionbag.displayAnimal = displayAnimal
functionbag.loadBackground = loadBackground
functionbag.loadYardBackground = loadYardBackground
functionbag.loadLogo = loadLogo
functionbag.animateAnimal = animateAnimal
functionbag.createButtonBack = createButtonBack

return functionbag