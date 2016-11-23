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

functionbag.createButton = createButton

return functionbag0