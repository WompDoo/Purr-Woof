
local composer = require( "composer" )
local widget = require "widget"
local functions = require( "utils.functions" )
local myData = require( "utils.saveddata" )

local scene = composer.newScene()

local function captureScreen()
  local screenshot = display.captureScreen(true)  
  --display.save( screenshot, { filename= os.date("%Y%m%d%H%M%S") .. "_yard.png", captureOffscreenArea=true, backgroundColor={0,0,0,0} } )
  screenshot:removeSelf()
  local alert = native.showAlert( "Success", "Screen Capture Saved to Library", { "OK" } )

end

local function onButtonTouch( event )
    if ( event.phase == "began" ) then
    elseif ( event.phase == "moved" ) then
      local dy = math.abs(event.y - event.yStart)
      local dx = math.abs(event.x - event.xStart)

      if dy > 5 or dx > 5 then
        animal:removeEventListener("touch", onButtonTouch) 
        local coin = display.newImageRect( "pictures/coin.png", 60, 60 )
        coin.x = display.contentCenterX
        coin.y = animal.y - (animal.height*0.3)
        transition.moveTo( coin, { x=coin.x, y=coin.y - 100, time=450, onComplete = function(obj) animal:addEventListener("touch", onButtonTouch) obj:removeSelf() end } )
        myData.availableMoney = myData.availableMoney + 5
        moneycounter:setLabel(myData.availableMoney)
      end
    elseif ( event.phase == "ended" ) then
    end
    return true
end

local function onCounterRelease()
  composer.gotoScene( "shop")
  composer.removeScene("yard")
  if animalTimer then 
    timer.cancel(animalTimer)
  end
  return true -- indicates successful touch
end

local function onBackBtnRelease()
  composer.gotoScene("mainmenu") 
  composer.removeScene("yard")
  if animalTimer then 
    timer.cancel(animalTimer)
  end

  return true -- indicates successful touch
end  

function scene:create( event )
local sceneGroup = self.view

local background = functions.loadYardBackground()

animal = nil

if myData.chosenAnimal then
  chance = math.random()
  if chance > 0.5 then 
    animal = functions.animateAnimal(myData.chosenAnimal["baseurl"] .. "idleanim.png")
  else
    physics = require("physics");
    physics.start()
    left = display.newLine(0, 0, 0, display.actualContentHeight)
    left.isVisible = false
    right = display.newLine(display.contentWidth, 0, display.contentWidth, display.actualContentHeight)
    right.isVisible = false
    bottom = display.newLine(0, display.actualContentHeight, display.contentWidth, display.actualContentHeight)
    bottom.isVisible = false
    animal = functions.animateAnimal(myData.chosenAnimal["baseurl"] .. "walkanim.png")
    physics.addBody(animal, "kinematic", {isSensor = true})
    physics.addBody(left, 'static', { bounce = 0.1})
    physics.addBody(right, 'static', { bounce = 0.1})
    physics.addBody(bottom, 'static', { bounce = 0.1})
    function moveRandomly()
      randomx = math.random(-100,100);
      animal:setLinearVelocity(randomx, math.random(-100,100));
      if randomx > 0 then
        animal.xScale = -0.5
        animal.yScale = 0.5
      else
        animal.xScale = 0.5
        animal.yScale = 0.5      
      end

    end
    animalTimer = timer.performWithDelay(1000, moveRandomly, -1);
  end
  animal.x = display.contentCenterX
  animal.y = display.actualContentHeight - (animal.height*0.5)
  animal:scale(0.5, 0.5)
  animal:addEventListener("touch", onButtonTouch)
end

cameraBtn = widget.newButton{
    defaultFile="pictures/camera.png",
    label=Pct,
    labelColor = { default={black}, over={black} },
    width=60, height=60,
    font = "dogfont.ttf",
    fontSize = 28,
    onRelease = captureScreen
  }
  cameraBtn.x = display.actualContentWidth - (cameraBtn.width*0.5)
  cameraBtn.y = 70

if not myData.availableMoney then 
  myData.availableMoney = 0
end

moneycounter = widget.newButton{
    defaultFile="pictures/coin.png",
    label=myData.availableMoney,
    labelColor = { default={black}, over={black} },
    width=60, height=60,
    font = "dogfont.ttf",
    fontSize = 28,
    onRelease = onCounterRelease
  }
  moneycounter.x = display.actualContentWidth - (moneycounter.width*0.5)
  moneycounter.y =10
  
local backBtn = functions.createButtonBack(onBackBtnRelease)

sceneGroup:insert( background )
sceneGroup:insert( cameraBtn )
sceneGroup:insert( moneycounter )
sceneGroup:insert( backBtn )
if animal then
  sceneGroup:insert( animal )
  animal:play()
end

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
    playBtn:removeSelf()  -- widgets must be manually removed
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