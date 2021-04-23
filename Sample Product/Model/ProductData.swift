//
//  ProductData.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/22/21.
//

import RealmSwift
import Foundation

class ProductData:Object{
    
    @objc dynamic var ProductTitle: String?
    @objc dynamic var ProductImage: String?
    @objc dynamic var ProductCount: Int = 1
    @objc dynamic var ProductPrice: String?
    @objc dynamic var ProductId:Int=0

    @objc dynamic var id:Int=0

    override static func primaryKey() -> String? {
        return "id"
    }
    
}
