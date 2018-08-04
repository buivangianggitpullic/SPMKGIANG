//
//  SPSProductForWareHouse.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/17/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

class SPSProductForWareHouse: SPSProduct {

     var totalProduct: Double = 0
     var totalsoldProduct: Double = 0
    
    
    init(name: String, id: Int, manuFactured: String , point: Double, saleOff: Double, importForSale: Double, priceSale: Double, totalProduct: Double, totalSoldProduct: Double) {
        
        super.init()
        
        self.namePr = name
        self.Id = id
        self.manufacture = manuFactured
        self.pointForSave = point
        self.saleOff = saleOff
        self.improtPrice = importForSale
        self.priceforSale = priceSale
        self.totalProduct = totalProduct
        self.totalsoldProduct = totalSoldProduct
    }
    
}
