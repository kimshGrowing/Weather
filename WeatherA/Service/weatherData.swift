//
//  weatherData.swift
//  WeatherA
//
//  Created by gsm10 on 2021/11/11.
//

import Foundation
import Moya
import RxSwift

enum WeatherAPI {
    case showCurrentWeather(cityName: String)
}

extension WeatherAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://api.openweathermap.org/data/2.5")!
    }
    
    var path: String {
        return "weather"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self{
        case .showCurrentWeather(let cityName):
            let param = [
                "q" : cityName,
                "appid" : ProcessInfo.processInfo.environment["appid"]!
            ]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    
}

struct API {
    static let shared = API()
    
    let disposeBag: DisposeBag = .init()
    
    func getTest() {
        let provider = MoyaProvider<WeatherAPI>()
        
        provider.rx.request(.showCurrentWeather(cityName: "gwangju"))
            .subscribe {(json) in
                switch json {
                case .success(let response):
                    let decoder = JSONDecoder()
                    let data = try? decoder.decode(Weathers.self, from: response.data)
                    print(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }
}
