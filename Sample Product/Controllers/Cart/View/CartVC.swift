//
//  CartVC.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/22/21.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class CartVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!

    var Products: Results<ProductData>?
    
    lazy var realm = try! Realm()
    var arrayTotal:[Int]=[]
    var tot:Int=0
    var totalAmount = 0

    var list = [ProductModel]()
    var Product: ProductData?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        setup()
    }
    
    func setup(){
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
    }
    
    func loadCategories() {
        Products = realm.objects(ProductData.self)
        print(Products as Any)
        tableview.reloadData()
    }
    
    @IBAction func DeletePressed(_ sender: Any) {
        try! realm.write {
          realm.deleteAll()
            loadCategories()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        loadCategories()
    }

    override func viewDidAppear(_ animated: Bool) {
        loadCategories()
    }
    
}
extension CartVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Products != nil {
            return Products?.count ?? 0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableview.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        let Cell: CartTableViewCell = tableview.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        Cell.pricelb.text = Products?[indexPath.row].ProductPrice ?? ""
        Cell.titlelb.text = Products?[indexPath.row].ProductTitle ?? ""
        Cell.productImage.image = UIImage(named: Products?[indexPath.row].ProductImage ?? "" )
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
