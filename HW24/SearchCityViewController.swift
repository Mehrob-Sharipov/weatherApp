//
//  SearchCityViewController.swift
//  HW24
//
//  Created by Sharipov Mehrob on 30.07.2023.
//

import Foundation
import UIKit

class SearchCityViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: GetCityNameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    var cityArray : [SearchModel]? = nil
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension SearchCityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        WeatherManager.shared.serchRequest(cityName: searchText) { data in
            DispatchQueue.global().async {
                self.cityArray = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}




extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        if let city = cityArray?[indexPath.row].address {
            if let country = city.country, let name = city.name {
                content.text = "\(country),\(name)"
             }
           
        }
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let city = cityArray?[indexPath.row].address?.name {
            delegate?.sendCity(cityName: city)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
