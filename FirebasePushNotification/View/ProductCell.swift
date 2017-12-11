//
//  ProductCell.swift
//  FirebasePushNotification
//
//  Created by Tanay Kumar on 12/9/17.
//  Copyright © 2017 Tanay Kumar Roy. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price()
    }
}
