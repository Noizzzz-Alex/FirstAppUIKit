//
//  PhotosPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

class PhotosPageCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "Cell"
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: 100, height: 100)
            flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 50, bottom: 30, right: 50)
//        flowLayout.sectionInset.bottom = -
            super.init(collectionViewLayout: flowLayout)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView!.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Переиспользование ячейки
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let cell = cell as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.tap = {[weak self] image in self?.navigationController?.pushViewController(ImageViewController(image: image), animated: true)
        }
        
        
        return cell
    }
}
    

#Preview{
    PhotosPageCollectionViewController(collectionViewLayout:.init())
}

