//
//  SPSConstant.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/22/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import Foundation
import Toast_Swift


let kNameTbDataProduct = "tblSPSProductManager"


let fomartDate = "dd-MM-yyyy"

func fomartCurrency(money: String, wSelf: UIViewController) -> String {
    // check xem no co phai la so khong
    if let tipAmount = Double(money) {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: tipAmount as NSNumber) {
            return formattedTipAmount
        }
    } else {
        wSelf.view.makeToast("Lỗi định dạng!")
    }
    
    
    return ""
}
