//
//  ProductViewModel.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/21/21.
//


import RxSwift
import RxCocoa
import Foundation

class ProductViewModel {
    
    // Encapsulation
    private var productModelSubject = PublishSubject<[ProductModel]>()

    var productModelObservable: Observable<[ProductModel]>{
        return productModelSubject
    }
    
    func getProduct(){
        print(productModelSubject)
        
    }
}

    

