//
//  SPSProduct.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/11/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit
import RealmSwift

class SPSProduct: Object {
    
    @objc dynamic var Id: Int = 0
    @objc dynamic var codePr: String = ""
    @objc dynamic var namePr: String = ""
    @objc dynamic var manufacture: String = ""
    @objc dynamic var dateOfManuFactire: Date = Date()
    @objc dynamic var expiryDate: Date = Date()
    @objc dynamic var dateOfEntry: Date = Date()
    @objc dynamic var pointForSave: CGFloat = 0.0
    @objc dynamic var saleOff: Double = 0.0
    @objc dynamic var improtPrice: Double = 0.0
    @objc dynamic var priceforSale: Double = 0.0
    @objc dynamic var isSale: Bool = false
    @objc dynamic var productReturn: Double = 0
    // su dung thuoc tinh nay de luu dung transection

    
}


