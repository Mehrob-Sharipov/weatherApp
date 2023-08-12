//
//  WeatherManager.swift
//  HW24
//
//  Created by Sharipov Mehrob on 20.07.2023.
//

import Foundation
import CoreLocation


class WeatherManager {
    static let shared = WeatherManager()
    private init (){}
    
    enum RequestType {
        case currentLocation(city: String)
        case byCityName(lat:CLLocationDegrees, lon:CLLocationDegrees)
    }
    
    private let APIkey = "a5f32b45f47a4ddeb7d70511232307"
    
    var weatherData: WeatherData? = nil
    
    var cityList: [String] = ["Dushanbe", "Moscow"]
    
    
    
    func getWeatherRequest(requestType:RequestType, completion: @escaping (WeatherData)->() ){
        //fix bug
        var hostURL = "https://api.weatherapi.com/v1/"

        guard let encodedUrl = hostURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}

        
        switch requestType {
        case .currentLocation(let city):
            hostURL += "forecast.json?key=\(APIkey)&q=\(city)&days=5"
        case .byCityName(let lat, let lon):
            hostURL += "forecast.json?key=\(APIkey)&q=\(lat),\(lon)&days=5"
        }
        
        
        
        guard let stringURL = URL(string: encodedUrl) else {return}
        let request = URLRequest(url: stringURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                self.weatherData = weatherData
                completion(weatherData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    
    
    
    
    func serchRequest2(cityName:String, completion: @escaping ([SearchModel])->() ){
        
        let hostURL = "https://api.weatherapi.com/v1/search.json?key=\(APIkey)&q=\(cityName)"
        
        guard let encodedUrl = hostURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        guard let stringURL = URL(string: encodedUrl) else {return}
        let request = URLRequest(url: stringURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            do {
                
                let searchModel = try JSONDecoder().decode([SearchModel].self, from: data)
                completion(searchModel)
                print(searchModel)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    func serchRequest(cityName:String, completion: @escaping ([SearchModel])->() ){
        let hostURL = "https://api.locationiq.com/v1/autocomplete?key=pk.b5f8287762152d6e2865c23a606dc287&q=\(cityName)&limit=5&dedupe=1"
        
        guard let encodedUrl = hostURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        guard let stringURL = URL(string: encodedUrl) else {return}
        let request = URLRequest(url: stringURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            do {
                
                let searchModel = try JSONDecoder().decode([SearchModel].self, from: data)
                completion(searchModel)
                print(searchModel)
                
            } catch {
                print(error)
            }
        }.resume()
    }
}
