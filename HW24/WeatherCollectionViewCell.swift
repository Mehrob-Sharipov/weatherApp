//
//  WeatherCollectionViewCell.swift
//  HW24
//
//  Created by Sharipov Mehrob on 23.07.2023.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    
    var cellImageView = UIImageView()
    var myView = UIView()
    
    var conditionLable = UILabel()
    var tempLable = UILabel()
    var datelable = UILabel()
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLables()
        
        datelable.text = "datelable"
        conditionLable.text = "conditionLable"
        tempLable.text = "tempLable"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func cellConfig(indexPath:IndexPath){
        guard let weatherManager = WeatherManager.shared.weatherData else {return}
        
        datelable.text = weatherManager.forecast?.forecastday?[indexPath.item].date
        conditionLable.text = weatherManager.forecast?.forecastday?[indexPath.item].day?.condition?.text
        tempLable.text = weatherManager.forecast?.forecastday?[indexPath.item].day?.maxtempC?.description
    }
    
    
    
    
    func setupViews(){
        [cellImageView,myView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            
//            $0.layer.cornerRadius = 10
//            $0.layer.borderWidth = 0.3
//            $0.layer.borderColor = UIColor.darkGray.cgColor
        }
        
        cellImageView.contentMode = .scaleAspectFit
        cellImageView.image = UIImage(systemName: "sun.min")
        cellImageView.backgroundColor = .clear
        cellImageView.tintColor = .black
        
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3),
            
            myView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            myView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor,constant: 8),
            myView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
        ])
    }
    
    
    func setupLables(){
        [datelable, conditionLable, tempLable].forEach {
            myView.addSubview($0)
            $0.textAlignment = .center
            $0.adjustsFontSizeToFitWidth = true
            $0.font = .init(name: "Apple SD Gothic Neo", size: 20)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let height = contentView.frame.height / 3
        
        NSLayoutConstraint.activate([
            datelable.topAnchor.constraint(equalTo: myView.topAnchor),
            datelable.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 4),
            datelable.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -4),
            datelable.heightAnchor.constraint(equalToConstant: height),
            
            conditionLable.topAnchor.constraint(equalTo: datelable.bottomAnchor,constant: 2),
            conditionLable.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 4),
            conditionLable.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -4),
            conditionLable.heightAnchor.constraint(equalToConstant: height),
            
            tempLable.topAnchor.constraint(equalTo: conditionLable.bottomAnchor,constant: 2),
            tempLable.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 4),
            tempLable.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -4),
            tempLable.heightAnchor.constraint(equalToConstant: height),
        ])
    }
    
    
    
    
    
}
