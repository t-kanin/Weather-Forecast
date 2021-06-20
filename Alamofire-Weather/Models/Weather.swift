//
//  Weather.swift
//  Alamofire-Weather
//
//  Created by kanin tansirisittikul on 20/6/2564 BE.
//

import Foundation

class Weather {
    // optional because the data not always available so it could be nil
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let icon: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precip"
        static let summary = "weather_descriptions"
        static let icon = "weather_icons"
    }
    
    init(weatherDictionary: [String : Any]){
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        }else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        }else{
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        icon = weatherDictionary[WeatherKeys.icon] as? String
    }
    
    
}
