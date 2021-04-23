//
//  ProductVC.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/21/21.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class ProductVC: UIViewController {

    @IBOutlet weak var CartBtn: BadgeBarButtonItem!
    @IBOutlet weak var productsCollectionview: UICollectionView!
    
    let disposeBag = DisposeBag()
    let ProductCart = ProductData()

    var Products: Results<ProductData>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        APIService.instance.GetProducts()
        setup()
    }
    
    func startTimer() {
//        259200
    _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    @objc
    func autoScroll() {
        loadCategories()
    }
    
    func setup(){
        loadCategories()
        
        productsCollectionview.delegate = self
        productsCollectionview.dataSource = self
        productsCollectionview.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(subscribeToCartButton), name: NSNotification.Name(rawValue: "CartPage"), object: nil)
    }
    
    @objc func subscribeToCartButton() {
        self.performSegue(withIdentifier: "CartPage", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        loadCategories()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCategories()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        loadCategories()
    }
    
}
extension ProductVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return share.Productlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell: ProductCollectionViewCell = productsCollectionview.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        cell.titlelb.text = share.Productlist[indexPath.row].title
        cell.productImage.image = UIImage(named: share.Productlist[indexPath.row].image ?? "")
        
        
        cell.addCartBtn.addTarget(self, action: #selector(connectedCart(sender:)), for: .touchUpInside)
        cell.addCartBtn.tag = indexPath.row

        return cell
    }
    @objc func connectedCart(sender: UIButton){
        self.loadCategories()
        let selectitem = self.Products?.first(where: {$0.ProductId == share.Productlist[sender.tag].id})
        if selectitem?.ProductId != share.Productlist[sender.tag].id {
            try! realm.write {
                ProductCart.ProductTitle = share.Productlist[sender.tag].title ?? ""
                ProductCart.ProductPrice = share.Productlist[sender.tag].price ?? ""
                ProductCart.ProductImage = share.Productlist[sender.tag].image ?? ""
                ProductCart.ProductId = share.Productlist[sender.tag].id ?? 0
                ProductCart.id = incrementID()
                self.save(Product: ProductCart)
                loadCategories()
            }
        }else{
        }
    }
    
}
extension ProductVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
     {
        let cellSize = CGSize(width: productsCollectionview.frame.width/2, height: 300)
        return cellSize
    }
}
extension ProductVC{
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(ProductData.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    
    func save(Product: ProductData) {
            do {
                try realm.safeWrite {
                    realm.add(Product)
                    loadCategories()
                }
            } catch {
                print("error saving categories \(error)")
            }
    }
    
    func checkImageNameExist(id: Int) -> Bool {
        return realm.object(ofType: ProductData.self, forPrimaryKey: id) != nil
    }
    
    func loadCategories() {
        Products = realm.objects(ProductData.self)
        CartBtn.badgeNumber = Products?.count ?? 0
    }
    
}
