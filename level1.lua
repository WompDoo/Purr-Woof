-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- We need physics started to add bodies, but we don't want the simulaton
	-- running until the scene is on the screen.
	physics.start()
	physics.pause()


	-- create a grey rectangle as the backdrop
	-- the physical screen will likely be a different shape than our defined content area
	-- since we are going to position the background from it's top, left corner, draw the
	-- background at the real top, left corner.
	local background = display.newRect( display.screenOriginX, display.screenOriginY, screenW, screenH )
	background.anchorX = 0 
	background.anchorY = 0
	background:setFillColor( .5 )
	
	-- make a crate (off-screen), position it, and rotate slightly
	local crate = display.newImageRect( "crate.png", 40, 40 )
	crate.x, crate.y = 120, -100
	crate.rotation = 15

	local crate2 = display.newImageRect( "crate.png", 40, 40 )
	crate2.x, crate2.y = 160, -100
	crate2.rotation = 15

	local crate3 = display.newImageRect( "crate.png", 40, 40 )
	crate3.x, crate3.y = 200, -100
	crate3.rotation = 15

	local crate4 = display.newImageRect( "crate.png", 40, 40 )
	crate4.x, crate4.y = 120, -60
	crate4.rotation = 15

	local crate5 = display.newImageRect( "crate.png", 40, 40 )
	crate5.x, crate5.y = 160, -60
	crate5.rotation = 15

	local crate6 = display.newImageRect( "crate.png", 40, 40 )
	crate6.x, crate6.y = 200, -60
	crate6.rotation = 15


	-- add physics to the crate
	physics.addBody( crate, { density=1.0, friction=0.3, bounce=0.3 } )
	physics.addBody( crate2, { density=1.0, friction=0.3, bounce=0.7 } )
	physics.addBody( crate3, { density=1.0, friction=0.3, bounce=0.6 } )
	physics.addBody( crate4, { density=1.0, friction=0.3, bounce=0.4 } )
	physics.addBody( crate5, { density=1.0, friction=0.3, bounce=0.6 } )
	physics.addBody( crate6, { density=1.0, friction=0.3, bounce=0.9 } )
	
	local crate7 = display.newImageRect( "crate.png", 19, 19 )
	crate7.anchorX = 0
	crate7.anchorY = 1
	crate7.x, crate7.y = 200, 300	
	physics.addBody( crate7, "static", { friction=0.3, shape=20,20 } )

	local crate8 = display.newImageRect( "crate.png", 19, 19 )
	crate8.anchorX = 0
	crate8.anchorY = 1
	crate8.x, crate8.y = 100, 300	
	physics.addBody( crate8, "static", { friction=0.3, shape=20,20 } )

	local crate9 = display.newImageRect( "crate.png", 19, 19 )
	crate9.anchorX = 0
	crate9.anchorY = 1
	crate9.x, crate9.y = 300, 300	
	physics.addBody( crate9, "static", { friction=0.3, shape=20,20 } )

	local crate10 = display.newImageRect( "crate.png", 19, 19 )
	crate10.anchorX = 0
	crate10.anchorY = 1
	crate10.x, crate10.y = 10, 300	
	physics.addBody( crate10, "static", { friction=0.3, shape=20,20 } )


	-- create a grass object and add physics (with custom shape)
	local grass = display.newImageRect( "grass.png", screenW, 82 )
	grass.anchorX = 0
	grass.anchorY = 1
	--  draw the grass at the very bottom of the screen
	grass.x, grass.y = display.screenOriginX, display.actualContentHeight + display.screenOriginY
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	local grassShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
	physics.addBody( grass, "static", { friction=0.3, shape=grassShape } )
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( grass)
	sceneGroup:insert( crate )
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
		physics.start()
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
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene