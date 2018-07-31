//
//  SPSDtailProductExtentionTextFeilViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/24/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

extension SPSDetailProductViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("======== \(textField.text)")
        return true
    }
}
