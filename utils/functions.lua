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

functionbag.createButton = createButton
functionbag.displayAnimal = displayAnimal

return functionbag