//
//  ProductCollectionViewCell.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/21/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titlelb: UILabel!
    @IBOutlet weak var pricelb: UILabel!

    @IBOutlet weak var addCartBtn: UIButton!

    var product : ProductModel? {
        didSet {
            productImage.image = UIImage(named: product?.image ?? "")
            titlelb.text = product?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
