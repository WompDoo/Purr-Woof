
local composer = require( "composer" )
local functions = require( "utils.functions" )
local myData = require( "utils.saveddata" )

local scene = composer.newScene()

function scene:create( event )
local sceneGroup = self.view

local background = functions.loadYardBackground()

if myData.chosenAnimal then
  chance = math.random()
  if chance > 0.5 then 
    animal = functions.animateAnimal(myData.chosenAnimal["baseurl"] .. "idleanim.png")
  else
    animal = functions.animateAnimal(myData.chosenAnimal["baseurl"] .. "walkanim.png")
  end
  animal.x = display.contentCenterX
  animal.y = display.actualContentHeight - (animal.height*0.5)
  animal:scale(0.5, 0.5)
end

sceneGroup:insert( background )
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