-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )



-- include the Corona "composer" module
local composer = require "composer"
local json = require( "json" ) 
local myData = require("utils.saveddata")

-- load menu screen
composer.gotoScene( "menu" )

local function save_state()
    local path = system.pathForFile( "savedata.json", system.DocumentsDirectory )

    -- Open the file handle
    local file, errorString = io.open( path, "w" )
    
    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Write data to file
        file:write( json.encode(myData) )
        -- Close the file handle
        io.close( file )
    end

file = nil
end

local function load_saved_state()
    local path = system.pathForFile( "savedata.json", system.DocumentsDirectory )
    
    -- Open the file handle
    local file, errorString = io.open( path, "r" )
    
    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Read data from file
        local contents = file:read( "*a" )
        local savestatedata = json.decode(contents)
        if savestatedata.chosenAnimal then 
          myData.chosenAnimal = savestatedata.chosenAnimal
        end
        if savestatedata.availableMoney then 
          myData.availableMoney = savestatedata.availableMoney
        end
        if savestatedata.purchasedItems then 
          myData.purchasedItems =  savestatedata.purchasedItems
        end
        -- Close the file handle
        io.close( file )
        file = nil
        
    end
end


local function onSystemEvent( event )
 
   if ( event.type == "applicationExit" ) then
      save_state()
 
   elseif ( event.type == "applicationStart" ) then
      load_saved_state()
      
 
   end
end
Runtime:addEventListener( "system", onSystemEvent )