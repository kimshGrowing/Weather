//
//  BaseVC.swift
//  WeatherA
//
//  Created by gsm10 on 2021/11/11.
//

import UIKit

class BaseVC : UIViewController {
    let bound = UIScreen.main
    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    func configureVC(){
        view.backgroundColor = .white
    }
}
