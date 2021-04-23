//
//  ProductModel.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/21/21.
//

import Foundation
struct Products : Codable {
    let Product : [ProductModel]?
    
    
    enum CodingKeys: String, CodingKey {

        case Product = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        Product = try values.decodeIfPresent([ProductModel].self, forKey: .Product)

    }
}


struct ProductModel : Codable {
    let id : Int?
    let title : String?
    let image : String?
    let price : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case price = "price"
    }


    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        price = try values.decodeIfPresent(String.self, forKey: .price)

    }

    init(id: Int, title: String, image: String, price: String) {
        self.id = id
        self.title = title
        self.image = image
        self.price = price
    }
}
