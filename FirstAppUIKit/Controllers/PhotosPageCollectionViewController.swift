//
//  PhotosPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

class PhotosPageCollectionViewController: UICollectionViewController, BackgroundColor, ThemeChangeDelegate {
    
    
    
    // MARK: PROTOCOLS FUNC
    func changeBackgroundColor() {
        switch CurrentTheme.currentTheme {
        case .light:
            view.backgroundColor = .white
            collectionView.backgroundColor = .white
            tabBarController?.tabBar.barStyle = .default
            navigationController?.navigationBar.backgroundColor = .white
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.barStyle = .default
        case .dark:
            view.backgroundColor = .black
            collectionView.backgroundColor = .black
            tabBarController?.tabBar.barStyle = .black
            navigationController?.navigationBar.backgroundColor = .black
            navigationController?.navigationBar.barTintColor = .black
            navigationController?.navigationBar.barStyle = .black
        case .gray:
            view.backgroundColor = .gray
            collectionView.backgroundColor = .gray
            tabBarController?.tabBar.barStyle = .black
            navigationController?.navigationBar.backgroundColor = .gray
            navigationController?.navigationBar.barTintColor = .gray
            navigationController?.navigationBar.barStyle = .black
        }
    }

    func themeDidChanged(toTheme: ThemeType) {
        changeBackgroundColor()
    }

    
    
    // MARK: VARIABLES
    let request = NetworkService()
    static let reuseIdentifier = "PhotoCell"
    private var photos = [Photo]()

    
    
    // MARK: INITIALISATION
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 50, bottom: 30, right: 50)
        super.init(collectionViewLayout: flowLayout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    // MARK: LIFE CYCLE FUNC
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundColor()
        netGetPhotos()
        registerCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeBackgroundColor()
    }
    
    

    
    
    // MARK: COLLECTION VIEW
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosPageCollectionViewController.reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateCell(model: photos[indexPath.row])
        cell.tap = { [weak self] image in self?.navigationController?.pushViewController(ImageViewController(image: image), animated: true)
        }
        return cell
    }
    
    
    
    // MARK: PRIVATE FUNC
    private func registerCollectionView(){
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: PhotosPageCollectionViewController.reuseIdentifier)
    }

    
    
    // MARK: NETWORK FUNC
    func netGetPhotos() {
        NetworkService().getPhotos { [weak self] photos in
            self?.photos = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

#Preview {
    PhotosPageCollectionViewController(collectionViewLayout: .init())
}
