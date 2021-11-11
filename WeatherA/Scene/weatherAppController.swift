//
//  weatherAppController.swift
//  WeatherA
//
//  Created by gsm10 on 2021/11/11.
//

import UIKit

class weatherAppController : BaseVC {
    
    let a = API.shared
    
    override func configureVC() {
        super.configureVC()
        
        print(a.getTest())
        
    }
    

}
