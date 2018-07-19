//
//  SPSDetailProductViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/11/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

class SPSDetailProductViewController: SPSBaseViewController {

    @IBOutlet private weak var heightContentScrollView: NSLayoutConstraint!
    
    @IBOutlet private weak var codeProductTextFeil: UITextField!
    @IBOutlet private weak var namePrTextFeik: UITextField!
    @IBOutlet private weak var manufactorTextFeil: UITextField!
    @IBOutlet private weak var dateOfEntryTextField: UITextField!
    @IBOutlet private weak var dateOfManuFactireTextField: UITextField!
    @IBOutlet private weak var expiryDateTextField: UITextField!
    @IBOutlet private weak var importPriceTextField: UITextField!
    @IBOutlet private weak var priceForSaleTextField: UITextField!
    @IBOutlet private weak var saleOffTextField: UITextField!
    @IBOutlet private weak var pointForSaveTextField: UITextField!
    @IBOutlet private weak var totalProductInPutTextField: UITextField!
    @IBOutlet private weak var unitTextField: UITextField!
    @IBOutlet private weak var closeDatePickerView: UIView!
    @IBOutlet private weak var dateTimeDateView: UIView!
    @IBOutlet private weak var selectionDateTimePicker: UIDatePicker!
    
    var codeProduct: String = ""
    let realmManager = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UIScreen.main.bounds.height > 600 {
            heightContentScrollView.constant = UIScreen.main.bounds.height - 20
        } else {
            heightContentScrollView.constant = 647
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reseltAllButton_Action(_ sender: Any) {
        if let products = realmManager.getObjects(type: SPSProductForInputManagerModel.self) {
            print("============= count =\(products)")
        }
    }
    
    @IBAction func saveProductButton_Action(_ sender: Any) {
        let product = getDataFromUI()
        realmManager.saveObjects(objs: product)
    }
    
    func getDataFromUI() -> SPSProductForInputManagerModel {
        let prM = SPSProductForInputManagerModel()
        prM.Id = realmManager.incrementID(objs: SPSProductForInputManagerModel.self)
        prM.namePr = namePrTextFeik.text ?? ""
        prM.codePr = codeProductTextFeil.text ?? ""
        prM.manufacture = manufactorTextFeil.text ?? ""
//        prM.dateOfEntry = NSDate() dateOfEntryTextField.text ?? ""
//        prM.dateOfManuFactire = dateOfManuFactireTextField.text ?? ""
//        prM.dateOfEntry = dateOfEntryTextField.text ?? ""
        prM.productInput = Double(importPriceTextField.text ?? "0.0") ?? 0.0
        prM.priceforSale = Double(priceForSaleTextField.text ?? "0.0") ?? 0.0
        prM.saleOff = Double(saleOffTextField.text ?? "0") ?? 0.0
        prM.pointForSave = CGFloat(Double(pointForSaveTextField.text ?? "0") ?? 0.0)
        prM.productInput = Double(importPriceTextField.text ?? "0") ?? 0.0
        
        return prM
    }
    
    @IBAction func changeDateAction(_ sender: Any) {
        let datetime = selectionDateTimePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: datetime)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MM-yyyy"
        let strDate = formatter.string(from: yourDate!)
    }
    
    @IBAction func closeButton_Action(_ sender: Any) {
    }
}
