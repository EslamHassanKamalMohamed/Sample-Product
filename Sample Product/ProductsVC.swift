//
//  ProductsVC.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/21/21.
//

import UIKit

class ProductsVC: UIViewController {

    var categories: Results<basketDetails>?
    let realm = try! Realm()
    var selectedIndex = Int ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
