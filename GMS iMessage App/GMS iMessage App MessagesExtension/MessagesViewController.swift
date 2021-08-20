//
//  MessagesViewController.swift
//  GMS iMessage App MessagesExtension
//
//  Created by Lakshya Bakshi on 8/19/21.
//

import UIKit
import Messages
import GoogleMaps

class MessagesViewController: MSMessagesAppViewController {
    
    let apiKey = "Your API key"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code based on Google Maps tutorial at https://developers.google.com/maps/documentation/ios-sdk/map-with-marker?authuser=2
        // The API key in the tutorial is provided in the AppDelegate file, but since iMessage apps don't have such a file, it is included in a way that is comparable to the iMessage implementation; on the viewDidLoad of the first View Controller
        GMSServices.provideAPIKey(apiKey)
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

}
