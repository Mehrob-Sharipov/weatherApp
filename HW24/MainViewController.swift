
//  Created by Sharipov Mehrob on 20.07.2023.

//Создать погодное приложение на основе данных с открытого АПИ. Выбор города, данные: температура, //влажность, ветер, желательно визуальное сопровождение данных, прогноз на 3 и 7 дней

import UIKit
import CoreLocation




class MainViewController: UIViewController{
    
    
    @IBOutlet weak var currentLocationLable: UILabel!
    @IBOutlet weak var currentWeatherImageView: UIImageView!
    @IBOutlet weak var minTempLable: UILabel!
    
    @IBOutlet weak var currentTempLable: UILabel!
    @IBOutlet weak var maxTempLable: UILabel!
    
    @IBOutlet weak var collectionViewBord: UIView!
    @IBOutlet weak var infoTempView: UIView!
    
    
    @IBOutlet weak var minTitle: UILabel!
    @IBOutlet weak var currentTitle: UILabel!
    @IBOutlet weak var maxTitle: UILabel!
    
    let weatherManager = WeatherManager.shared
    var locationManager = CLLocationManager()
    
    let reuseIdentifier = "Cell"
    
    var weatherCollectionView: UICollectionView! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CityListViewController().delegate = self
        
        setCollectionView()
        setLocationManager()
        
        infoTempView.layer.cornerRadius = 10
        infoTempView.layer.borderWidth = 0.3
        infoTempView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setLocalized()
    }
    
    
    
    func setLocalized(){
        minTitle.text = "Min".localized()
        currentTitle.text = "Current".localized()
        maxTitle.text = "Max".localized()
    }
    
    
    func updateInterface(data: WeatherData){
        DispatchQueue.global().async {
            
            if let forecastday = data.forecast?.forecastday?.first?.day,
               let current = data.current?.tempC,
               let location = data.location {
                
                DispatchQueue.main.async {
                    
                    self.minTempLable.text = forecastday.mintempC?.description
                    self.maxTempLable.text = forecastday.maxtempC?.description
                    
                    self.currentTempLable.text = current.description
                    self.currentLocationLable.text = location.name
                    
                    self.weatherCollectionView.reloadData()
                }
            }
        }
    }
    
    
    
    
    
    
    
    @IBAction func currentForcastButtonPressed(_ sender: Any) {
        locationManager.startUpdatingLocation()
        
        if let location = locationManager.location?.coordinate {
            weatherManager.getWeatherRequest(requestType: .byCityName(lat: location.latitude, lon: location.longitude)) { WeatherData in
                DispatchQueue.main.async {
                    self.updateInterface(data: WeatherData)
                }
            }
        }
    }
    
    
    
    @IBAction func cityListBUttonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "CityListViewController") as? CityListViewController else {return}
        
        vc.delegate = self
        locationManager.stopUpdatingLocation()
        navigationController?.pushViewController(vc, animated: true)
    }
}



extension MainViewController: GetCityNameDelegate {
    func sendCity(cityName: String) {
        
        //   currentLocationLable.text = cityName
        
        weatherManager.getWeatherRequest(requestType: .currentLocation(city: cityName)) { WeatherData in
            DispatchQueue.main.async {
                self.updateInterface(data: WeatherData)
            }
        }
    }
}





