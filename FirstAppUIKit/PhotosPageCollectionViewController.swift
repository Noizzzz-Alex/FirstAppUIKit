//
//  PhotosPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

class PhotosPageCollectionViewController: UICollectionViewController {
    let request = NetworkService()
    static let reuseIdentifier = "PhotoCell"
    private var photos = [Photo]()

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 50, bottom: 30, right: 50)
        super.init(collectionViewLayout: flowLayout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: PhotosPageCollectionViewController.reuseIdentifier)
        NetworkService().getPhotos { [weak self] photos in
            self?.photos = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

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
}

#Preview {
    PhotosPageCollectionViewController(collectionViewLayout: .init())
}
