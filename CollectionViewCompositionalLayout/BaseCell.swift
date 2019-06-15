//
//  BaseCell.swift
//  CollectionViewCompositionalLayout
//
//  Created by Viswa Kodela on 6/15/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLayout()
    }
    
    fileprivate func createLayout() {
        let seperatorView = UIView()
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.backgroundColor = .white
        
        addSubview(seperatorView)
        seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("BaseCell is not initialized")
    }
}
