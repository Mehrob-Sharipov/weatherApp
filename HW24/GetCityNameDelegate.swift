//
//  CityListViewControllerProtocol.swift
//  HW24
//
//  Created by Sharipov Mehrob on 30.07.2023.
//

import Foundation


protocol GetCityNameDelegate:AnyObject {
    func sendCity(cityName: String)
}
