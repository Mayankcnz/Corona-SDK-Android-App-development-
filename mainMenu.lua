--We need to do this at the start of every scene
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

--Need this so we can use buttons
local widget = require ("widget")





---------------------------------------------------------------------------------
--This function is called when the scene is first shown, so we can put all our code to make objects in here
function scene:createScene( event )
	--Every object we make needs to be added to myGroup so that the program knows which ones to remove when the scene is exited
	local myGroup = self.view
	
		
	 local image = display.newImage("logo.gif")--display new image on the screen
     image:setReferencePoint(display.CenterReferencePoint)
	 image.x=170
	 image.y=100
	 image.width=230
	 image.height=145
	   
	myGroup:insert(image)
	


	--Add background image
	local background = display.newImage("wow.jpg")
	background:toBack();
	 image:setReferencePoint(display.CenterReferencePoint)
	 image.x=170
	 image.y=100
	 image.width=250
	 image.height=160
	
	
	
	
	
	

--Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        storyboard.gotoScene("scene1", "fade", 200);
    end
end

local button2 = widget.newButton
{
    width = 60,
    height = 60,
    defaultFile = "alright.png",
    overFile = "alrightoverr.gif",
    --label = "button",
    onEvent = handleButtonEvent
}

-- Center the button
button2.x = 160
button2.y = 210
myGroup:insert(button2)
-- Change the button's label text
--button1:setLabel( "2-Image" )

--Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        storyboard.gotoScene("youtube", "fromLeft", 400);
    end
end
local button3 = widget.newButton
{
    width = 230,
    height = 120,
    defaultFile = "over.png",
    overFile = "overrr.png",
    --label = "button",
    onEvent = handleButtonEvent
}

-- Center the button
button3.x = 164
button3.y = 300
myGroup:insert(button3)
-- Change the button's label text
--button1:setLabel( "2-Image" )

    --When a button is pressed, go to the appropriate scene
	local function handleButtonEvent( event )
		--if main menu button
		if event.target.id == "btnMainMenu" then
			if ( "ended" == event.phase ) then
				storyboard.gotoScene("mainMenu", "fromLeft", 400);
			end	
		--if overlay button
		elseif event.target.id == "btnOverlayMenu" then
			if ( "ended" == event.phase ) then
				storyboard.gotoScene("youtube", "fromLeft", 400);
			end
		end
	end


	local image = display.newImage("weeklyfreeheros.png")--display new image on the screen
    image:setReferencePoint(display.CenterReferencePoint)
	image.x=164                   
	image.y=422
	image.width=300
	image.height=140
	   
	myGroup:insert(image)
	
end






-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local myGroup = self.view
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local myGroup = self.view
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local myGroup = self.view
end





---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------
--Needed at the end of every scene
return scene