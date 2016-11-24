local widget = require "widget"

local functionbag = {}

local function createButton(labeltext, functionname)
  return widget.newButton{
    label=labeltext,
    labelColor = { default={black}, over={128} },
<<<<<<< Updated upstream
    default="button.png",
    over="button-over.png",
    width=154, height=40,
    font = "dogfont.ttf",
    fontSize = 28,
=======
    defaultFile="pictures/button3.png",
    font = "dogfont.ttf",
    fontSize = 28,
    width=154, height=65,
>>>>>>> Stashed changes
    onRelease = functionname  -- event listener function
  }
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

local function createButtonShopItem(labeltext, functionname)
  return widget.newButton{
    label=labeltext,
    labelColor = { default={black}, over={128} },
    defaultFile="pictures/item.png",
    width=120, height=120,
    font = "dogfont.ttf",
    fontSize = 28,
    labelYOffset = 33,
    onRelease = functionname  -- event listener function
  }
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
  background = display.newImageRect( "pictures/yardwin.png", display.actualContentWidth, display.actualContentHeight )
  background.anchorX = 0
  background.anchorY = 0
  background.x = 0 + display.screenOriginX 
  background.y = 0 + display.screenOriginY
  return background
end

local function loadLogo(y)
  titleLogo = display.newImageRect( "pictures/logo.png", 264, 42 )
  titleLogo.x = display.contentCenterX
  titleLogo.y = y
  return titleLogo
end

local function displayAnimal(image)
  animal = display.newImageRect( image, 280, 290 )
  animal.x = display.contentCenterX
  animal.y = 220
  return animal
end

functionbag.createButton = createButton
functionbag.createButtonShop = createButtonShop
functionbag.createButtonShopItem = createButtonShopItem
functionbag.displayAnimal = displayAnimal
functionbag.loadBackground = loadBackground
functionbag.loadYardBackground = loadYardBackground
functionbag.loadLogo = loadLogo

return functionbag