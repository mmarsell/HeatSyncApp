
Here is a guide of what you'd need to implement to hopefully get the bluetooth working on the backend.

In order to edit and test the code you must be using XCode, which you can download from the app store (it can only be run on mac or a mac virtual machine)

When you want to open the project just navigate to the HeatSync.xcodeproj file and open that in xcode

I was following a guide here (for bluetooth functionality) if you want to follow along: https://www.frecodecamp.org/news/ultimate-how-to-bluetooth-swift-with-hardware-in-20-minutes/

There are several important files you should look at:

1. ArduinoPeripheral.swift - 
	A file that houses the characteristics of the arduino, ideally this is where you would put each thing you want 		to change or get from the arduino (like battery, temperature etc.). Each characteristic has to have a specific 		UUID (you can look at the link above for examples). I added a few UUIDs from the information page of the 		bluetooth module you sent me, but I wasn't sure how to get the UUID's for the individual components or fields.

2. ViewController.swift -
	This is the main functionality file of the app. I've commented most of the variables and functions so you know 		what they do. The only thing I wasn't sure about was how to actually receive data from the arduino (the tutorial 	 above covers sending data).  Once you figure out how to receive the data, all you have to
	do is update the various labels that correspond to the data. 

	Example:
		So say you get the actual temperature reading from the vest and hold it in a variable called 				actualVestTempRead to update the label you would just do:
		vestTempReading.text = String(actualVestTempRead)
		
		This would be the same for all of the other labels as well

	Important functions to look at in this file:

	updatePower:  this function is called when the power switch on the app is flicked, this is where you'd want to 			send the bluetooth signal to turn on the arduino

	sendVestTemp: this function is called when the vest temperature slider is moved, basically it updates the vest 			temp slider text (so you know what value you are sending),
		then this calls another function sendTemp, that handles actually sending the data over bluetooth
	
	sendPelTemp: this function is called when the peltier temperature slider is moved, basically it updates the pel 		temp slider test (so you know what value you are sending),
		then this calls another function sendTemp, that handles actually sending the data over bluetooth

	sendVal: this function handles sending data over bluetooth to the connected peripheral 

	recieveInfo: this is an example function of how you'd update the labels. I wasn't sure of how to actually 			receive data from the arduino. Right now it does nothing and is never called, its just an example

	centralManagerDidUpdateState: basically this is called when the bluetooth for the phone is turned on, right now 		if its not turned on, it just sets the bluetooth label to OFF, if bluetooth is on, it starts scanning 			for devices (again couldn't really test this because I don't have the arduino)

	peripheral: this function you will need to edit for each of the characteristics (and their unique UUIDS), I put 		an example of what you'd need to do. You basically assign the found characteristic to one of the 			bluetooth characteristics variable I defined at the top of the file (so far for the peltier temperature, 		 vest temperature and power as these are all values you are sending)
		Then you enable the slider to change it (the sliders are disabled by default because, you only want to 			control them once they are connected to bluetooth, otherwise it'll crash).

	I'd highly suggest quickly going through the tutorial on the link at the top of this file, as most of the 		bluetooth code I got is from there and can probably explain better than I can.
	 
	All thats left for you to do is to receive data from the arduino (which I was having trouble figuring out)

3. Main.storyboard - 
	This is the visual display of the app, I wouldn't mess around too much with it because the screen constraints 		are a nightmare in IOS

4. LaunchScreen.storyboard - 
	This is just the screen that displays while the app is loading

5. Info.plist -
	This is a file that holds various permissions, the only thing I added was a bluetooth peripheral permission.

6. Assets.xcassets - 
	This is a folder that holds a bunch of image assets, like your logo and the app icon image

(the rest of the files I have not changed from the default)



Once you have everything working and you want to move the app to your phone you can follow a tutorial at the link below on how to do that:
here: https://docs.monaca.io/en/products_guide/monaca_ide/deploy/non_market_deploy/
or here: https://codewithchris.com/deploy-your-app-on-an-iphone/

Cheers and good luck!

