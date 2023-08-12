import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = .init(width: view.frame.width, height: 70)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        
        weatherCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        weatherCollectionView.backgroundColor = .clear
        weatherCollectionView.dataSource = self
        weatherCollectionView.delegate = self
        
        weatherCollectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier:reuseIdentifier)
        
        collectionViewBord.addSubview(weatherCollectionView)
        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: collectionViewBord.topAnchor),
            weatherCollectionView.bottomAnchor.constraint(equalTo: collectionViewBord.bottomAnchor),
            weatherCollectionView.leadingAnchor.constraint(equalTo: collectionViewBord.leadingAnchor, constant: 8),
            weatherCollectionView.trailingAnchor.constraint(equalTo: collectionViewBord.trailingAnchor, constant: -8),
        ])
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherManager.weatherData?.forecast?.forecastday?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        cell.cellConfig(indexPath: indexPath)
        return cell
    }
    
}
