//
//  weatherModel.swift
//  WeatherA
//
//  Created by gsm10 on 2021/11/11.
//

import Foundation
import Moya

struct Weathers : Codable{
    let weather : [WeatherModel]
    let base: String
    let main : Main
    let wind : Wind
    enum CodingKeys: String, CodingKey{
        case weather = "weather"
        case base
        case main
        case wind
    }
    init(from decoder: Decoder) throws {
        let v = try decoder.container(keyedBy: CodingKeys.self)
        weather = try v.decode([WeatherModel].self, forKey: .weather)
        base = try v.decode(String.self, forKey: .base)
        main = try v.decode(Main.self, forKey: .main)
        wind = try v.decode(Wind.self, forKey: .wind)
    }
    
}

struct WeatherModel : Codable{
    
    var main : String
    var icon : String
    
    

}

struct Main: Codable{
    let temp : Double
    let feels_like : Double
    let pressure : Int
    let humidity : Int
    let sea_level : Int
}

struct Wind: Codable{
    let speed : Double
    let gust : Double
}

