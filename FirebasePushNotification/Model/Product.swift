//
//  Product.swift
//  FirebasePushNotification
//
//  Created by Tanay Kumar on 12/9/17.
//  Copyright © 2017 Tanay Kumar Roy. All rights reserved.
//

import Foundation

struct Product {
    let title: String
    let cost: Double
    
    init(title: String, cost: Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String: Any]) {
        guard let title = valueDict["title"] as? String,
            let cost = valueDict["cost"] as? Double
            else { return nil }
        
        self.title = title
        self.cost = cost
    }
    
    
    func price() -> String {
        let costString = String(format: "%.2f", cost)
        return "$" + costString
    }
    
    func parameters() -> [String: Any] {
        let dict: [String: Any] = ["title": title,
                                   "cost": cost]
        return dict
    }
}