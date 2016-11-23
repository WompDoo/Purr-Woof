local widget = require "widget"

local functionbag = {}

local function createButton(labeltext, functionname)
  return widget.newButton{
    label=labeltext,
    labelColor = { default={black}, over={128} },
    default="button.png",
    over="button-over.png",
    width=154, height=40,
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

local function loadLogo(y)
  titleLogo = display.newImageRect( "pictures/logo.png", 264, 42 )
  titleLogo.x = display.contentCenterX
  titleLogo.y = y
  return titleLogo
end

functionbag.createButton = createButton
functionbag.displayAnimal = displayAnimal
functionbag.loadBackground = loadBackground
functionbag.loadLogo = loadLogo

return functionbag