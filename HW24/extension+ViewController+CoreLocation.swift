//
//  File.swift
//  HW24
//
//  Created by Sharipov Mehrob on 29.07.2023.
//

import Foundation
import UIKit
import CoreLocation

extension MainViewController:CLLocationManagerDelegate  {
    
    func setLocationManager(){
       locationManager.delegate = self
       locationManager.desiredAccuracy = kCLLocationAccuracyBest
       locationManager.requestAlwaysAuthorization()
       locationManager.startUpdatingLocation()
   }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = manager.location!.coordinate
        
        print("latitude - \(location.latitude) longitude - \(location.longitude)")
        
        weatherManager.getWeatherRequest(requestType: .byCityName(lat: location.latitude, lon: location.longitude)) { WeatherData in
            DispatchQueue.main.async {
                self.updateInterface(data: WeatherData)
            }
        }
        
    }
    
}
