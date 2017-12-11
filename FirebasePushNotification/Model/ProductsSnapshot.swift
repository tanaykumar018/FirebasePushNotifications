//
//  ProductsSnapshot.swift
//  FirebasePushNotification
//
//  Created by Tanay Kumar on 12/10/17.
//  Copyright © 2017 Tanay Kumar Roy. All rights reserved.
//

import Foundation
import Firebase

struct ProductsSnapshot {
    let products: [Product]
    
    init?(snapshot: DataSnapshot) {
        guard let snapDict = snapshot.value as? [String: [String: Any]] else { return nil }
        var products = [Product]()
        for snap in snapDict {
            guard let product = Product(valueDict: snap.value) else { continue }
            products.append(product)
        }
        self.products = products
    }
}

