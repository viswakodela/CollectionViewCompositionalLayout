//
//  ViewController.swift
//  CollectionViewCompositionalLayout
//
//  Created by Viswa Kodela on 6/15/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let baseCellID = "baseCellID"
    
    enum Section: CaseIterable {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
//        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        return cv
    }()
    
    fileprivate func configureLayout() {
        view.backgroundColor = .white
        collectionView.register(BaseCell.self, forCellWithReuseIdentifier: baseCellID)
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension BaseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: baseCellID, for: indexPath) as! BaseCell
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .green
        }
        return cell
    }
}

