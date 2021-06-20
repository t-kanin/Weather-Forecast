//
//  ForecastService.swift
//  Alamofire-Weather
//
//  Created by kanin tansirisittikul on 20/6/2564 BE.
//

import Foundation
import Alamofire

class ForecastService{
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String){
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "http://api.weatherstack.com/current?access_key=\(APIKey)")
    }
    
    typealias GetWeatherResponse = (Weather?) ->Void
    
    func getCurrentWeather(city: String, completion: @escaping(GetWeatherResponse)){
        if let forecastURL = URL(string: "\(forecastBaseURL!)&query=\(city)"){
            AF.request(forecastURL).responseJSON { (response) in
                // the current weather
                if let jsonDict = response.value as? [String: Any]{
                    if let currentWeatherDict = jsonDict["current"] as? [String: Any]{
                        print(currentWeatherDict)
                        let weather = Weather(weatherDictionary: currentWeatherDict)
                        completion(weather)
                    }  else{ completion(nil)} // don't get resposne
                }
            }
        }
    }
    
}
