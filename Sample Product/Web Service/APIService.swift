//
//  ApiService.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/22/21.
//

import Foundation


class APIService :  NSObject {
    static let instance = APIService()

    
    func GetProducts(){
        if let url = Bundle.main.url(forResource: "response", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Products.self, from: data)
                print(jsonData)
                share.Productlist = jsonData.Product ?? []
            } catch {
                print("error:\(error)")
            }
        }
    }
    
}
