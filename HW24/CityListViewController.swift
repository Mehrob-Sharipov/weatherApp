//
//  CityListViewController.swift
//  HW24
//
//  Created by Sharipov Mehrob on 30.07.2023.
//

import UIKit

class CityListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetCityNameDelegate {
  
 
    @IBOutlet weak var tablevVew: UITableView!
    
    weak var delegate: GetCityNameDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tablevVew.delegate = self
        tablevVew.dataSource = self
     }
    
    
    
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func addCityButtonPressed(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "SearchCityViewController") as? SearchCityViewController else {return}
        
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func sendCity(cityName: String) {
        DispatchQueue.global().async {
            WeatherManager.shared.cityList.append(cityName)
            DispatchQueue.main.async {
                self.tablevVew.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WeatherManager.shared.cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        var content = cell.defaultContentConfiguration()
        content.text = WeatherManager.shared.cityList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         delegate?.sendCity(cityName: WeatherManager.shared.cityList[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
    
}



