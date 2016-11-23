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

local function createButtonShop(labeltext, functionname)
  return widget.newButton{
    label=labeltext,
    labelColor = { default={black}, over={128} },
    defaultFile="pictures/tab.png",
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
    onRelease = functionname  -- event listener function
  }
end

functionbag.createButton = createButton
functionbag.createButtonShop = createButtonShop
functionbag.createButtonShopItem = createButtonShopItem

return functionbag