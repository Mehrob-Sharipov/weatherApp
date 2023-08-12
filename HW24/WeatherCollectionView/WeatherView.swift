//
//  File.swift
//  HW24
//
//  Created by Sharipov Mehrob on 23.07.2023.
//

import Foundation
import UIKit

class WeatherView: UIView {
    
    @IBOutlet weak var conditionLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var datelable: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
 
    
    
    static func instanceFromNib() -> WeatherView {
        return UINib(nibName: "WeatherView", bundle: nil).instantiate(withOwner: nil)[0] as! WeatherView
    }
    
    
    
    
    
}
