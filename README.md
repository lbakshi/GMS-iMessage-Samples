# GMS-iMessage-Samples
Two example apps used for product support with Google's iOS Map SDK

## How to run
1. Download and install XCode
2. Install cocoapods on MacOS using ```sudo gem install cocoapods``` if you don't already have it
3. From the base directory do both ```cd ../GMS\ Normal\ App``` and ```cd ../GMS\ iMessage\ App``` and follow the steps below for both the iMessage and Normal directories
  1. ```pod install```
  2. open the ```.xcworkspace``` file in either directory
  3. Change the bundle identifier and development team to your own in .xcodeproj > Targets > General
  4. Ensure that your Maps API key is permitted to run the declared bundles
4. For the Normal app, go to "GMS Normal App > ViewController.swift" and include your Maps-enabled API key as the apiKey variable. For the iMessage app, go to "GMS iMessage App MessagesExtension > MessagesViewController.swift" and include your Maps-enabled API key as the apiKey variable
5. Run either application on a connected mobile device (untested on simulator)

## Expected results
When running the normal app, the view should look as expected: a Google map focused on Sydney Australia with a marker

<img width="375" alt="image" src="https://user-images.githubusercontent.com/42747310/130194672-e4620f63-210f-42e2-bdbb-1822f158426e.png">

When running the iMessage app, the view fails to load the map and simply shows the google icon upon a grey map.

<img width="375" alt="image" src="https://user-images.githubusercontent.com/42747310/130194957-3ef600c5-7e5b-41d3-84ed-fafbdbff84f7.png">

## Steps taken to create both samples
1. Create two new XCode projects directly in Xcode, specifying an "App" for the normal app and an "iMessage extension" for the iMessage app
2. Add pod files specifying the installation of GoogleMaps, ```pod install```, and open the generated .xcworkspace files
3. **Specifically for the iMessage app**, go to ".xcodeproj > Targets > GMS iMessage App MessagesExtension > Build Settings > Other Linker Flags" and add ```-framework "GoogleMaps" -framework "GoogleMapsBase" -framework "GoogleMapsCore"```. *This step is necessary as pod install doesn't link the google maps frameworks to Message Extension targets*. 
4. Add code from https://developers.google.com/maps/documentation/ios-sdk/map-with-marker?authuser=2 to the view controllers. *Note that although the tutorial specifies that the api key should be provided in the AppDelegate file, I have provided the API key in the viewDidLoad of the sole view controllers since Message Apps lack an AppDelegate file.*
5. Include your API key in the apiKey variable on each view controller. Then, check to ensure the api key is declared to work for both bundle identifiers and run.
