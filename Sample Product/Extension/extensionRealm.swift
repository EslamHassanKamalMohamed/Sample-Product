//
//  extensionRealm.swift
//  Sample Product
//
//  Created by Eslam Hassan on 4/22/21.
//

import UIKit
import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
