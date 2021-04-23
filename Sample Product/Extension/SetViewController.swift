//
//  File.swift
//  Low Coast
//
//  Created by Eslam Hassan on 1/30/21.
//

import UIKit

extension UIViewController{
    func SetViewController(withIdentifier: String){
        let vc = share.storyBoard.instantiateViewController(withIdentifier: withIdentifier)
        self.present(vc, animated: true, completion: nil)
    }
}
