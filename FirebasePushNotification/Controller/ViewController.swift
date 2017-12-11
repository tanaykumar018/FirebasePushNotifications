//
//  ViewController.swift
//  FirebasePushNotification
//
//  Created by Tanay Kumar on 12/9/17.
//  Copyright © 2017 Tanay Kumar Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        FIRDatabaseService.shared.post(parameters: ["title" : "Shirt",
//                                                    "cost" : "25.00"], to: .products)
        
//        FIRDatabaseService.shared.observe(.products) { (snapshot) in
//            guard let productsSnapshot = ProductsSnapshot(snapshot: snapshot) else {return}
//            print(productsSnapshot)
//        }
        
        
        ProductsService.shared.delegate = self
        ProductsService.shared.observeProducts()
        
    }

    @IBAction func onAddTapped() {
        
        AlertService.addProductAlert(in: self) { (product) in
            AlertService.addProductAlert(in: self) { (product) in
                ProductsService.shared.post(product: product)
            }
        }
        
    }
    
    @IBAction func onSubscribeTapped() {
        AlertService.subscribeAlert(in: self)
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        let product = products[indexPath.item]
        cell.configure(with: product)
        return cell
    }
    
}

extension ViewController: ProductsServiceDelegate {
    func didChange(products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
}

