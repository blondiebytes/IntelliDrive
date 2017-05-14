//
//  ViewController.swift
//  IntelliDrive
//
//  Created by Kathryn Hodge on 5/13/17.
//  Copyright © 2017 blondiebytes. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {
    
    @IBOutlet var mapView: MQMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Call API
        
        let scriptUrl = "http://www.mapquestapi.com/directions/v2/route?key=I5cQRCrXg7JsjpBA6nxhKewhqYZsLmND&from=NewYork,+NY&to=2400+S+Glebe+Rd,+Arlington,+VA"
        
        let myUrl = NSURL(string: scriptUrl);
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    print(convertedJsonIntoDict)
                    
                    // Get value by key
                   // let firstNameValue = convertedJsonIntoDict["route"] as? String
                 //   print(firstNameValue!)
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // setting center
//        mapView?.latitude = 40.7128
//        mapView?.longitude = -74.0059
//        mapView?.zoomLevel = 10
        
        let nyc = CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407)
        mapView?.setCenter(nyc, zoomLevel: 11, animated: true)
        
        // annotation 1
        let foodOption = MGLPointFeature()
        foodOption.coordinate = CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407)
        foodOption.title = "McDonalds"
        foodOption.subtitle = "Fast food 10 min away"
        mapView?.addAnnotation(foodOption)
        
        // annotation 2
        let foodOption2 = MGLPointAnnotation()
        foodOption2.coordinate = CLLocationCoordinate2D(latitude: 40.72, longitude: -74.005)
        foodOption2.title = "McDonalds"
        foodOption2.subtitle = "Fast food"
        mapView?.addAnnotation(foodOption2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

