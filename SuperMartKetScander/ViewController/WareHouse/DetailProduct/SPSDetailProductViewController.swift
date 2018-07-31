//
//  SPSDetailProductViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/11/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit
import Toast_Swift


enum SPSTypeDate {
    case NSX
    case HSD
    case NN
}

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
    @IBOutlet private weak var alertContentView: UIView!
    @IBOutlet private weak var dateTimeDateView: UIView!
    @IBOutlet private weak var alertParentView: UIView!
    @IBOutlet private weak var alertTitleLabel: UILabel!
    @IBOutlet private weak var alertIconImageView: UIImageView!
    @IBOutlet private weak var selectionDateTimePicker: UIDatePicker!
    @IBOutlet private weak var unitLabel: UILabel!
    @IBOutlet private weak var numberOfProductLabel: UILabel!
    @IBOutlet private weak var hsdLabel: UILabel!
    @IBOutlet private weak var namePrLabel: UILabel!
    @IBOutlet private weak var importPriceLabel: UILabel!
    @IBOutlet private weak var salePiceLabel: UILabel!
    
    var codeProduct: String = ""
    var defaultFrame: CGRect = CGRect.zero
    var strDate: String = ""
    var typeButton: SPSTypeDate = .NN
    var dateOfManuFactire: Date = Date()
    var dateOfEntry: Date = Date()
    var expiryDate: Date = Date()
    var cacheDate: Date = Date()
    var countTextImportPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeProductTextFeil.text = codeProduct
        
        let currentDay = Date()
        let formatter = DateFormatter()
         formatter.dateFormat = fomartDate
        strDate = formatter.string(from: currentDay)
        importPriceTextField.delegate = self
        saleOffTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dateTimeDateView.isHidden = true
        alertParentView.isHidden = true
        defaultFrame = dateTimeDateView.frame
        self.dateTimeDateView.frame = CGRect(x: 0, y: self.view.bounds.height, width: self.view.bounds.width, height: self.view.bounds.height)
        closeDatePickerView.backgroundColor = UIColor.gray.withAlphaComponent(0.0)
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
        resetData()
    }
    
    @IBAction func saveProductButton_Action(_ sender: Any) {
        if checkValidate() {
            let item = getDataFromUI()
            weak var wSelf = self
            let _ = SPSProductManagerInputEntity.shared.insert(product: item) { (complete) in
                guard let mee = wSelf else { return }
                if complete {
                    mee.showAlert(success: true)
                } else {
                    mee.showAlert(success: false)
                }
            }
        } else {

            unitLabel.textColor = .red
            numberOfProductLabel.textColor = .red
            hsdLabel.textColor = .red
            namePrLabel.textColor = .red
            importPriceLabel.textColor = .red
            salePiceLabel.textColor = .red
            
        }
       
    }
    
    func getDataFromUI() -> SPSProductForInputManagerModel {
        let prM = SPSProductForInputManagerModel()
        prM.namePr = namePrTextFeik.text ?? ""
        prM.codePr = codeProductTextFeil.text ?? ""
        prM.manufacture = manufactorTextFeil.text ?? ""
        prM.dateOfEntry = dateOfEntry
        prM.dateOfManuFactire = dateOfManuFactire
        prM.expiryDate = expiryDate
        prM.improtPrice = Double(importPriceTextField.text ?? "0.0") ?? 0
        prM.priceforSale = Double(priceForSaleTextField.text ?? "0.0") ?? 0
        prM.saleOff = Double(saleOffTextField.text ?? "0") ?? 0.0
        prM.pointForSave = Double(pointForSaveTextField.text ?? "0") ?? 0
        prM.countProductInput = Double(totalProductInPutTextField.text ?? "0") ?? 0
        prM.unit = unitTextField.text ?? ""
        
        return prM
    }
    
    private func checkValidate() -> Bool {
        
        if namePrTextFeik.text == "" || expiryDateTextField.text == "" || importPriceTextField.text == ""
        || priceForSaleTextField.text == "" || Double(totalProductInPutTextField.text ?? "0") == 0 || unitTextField.text == ""
        {
            self.view.makeToast("Không được bỏ trống những ô có dấu '*'.")
            return false
        }
        return true
    }
    
    @IBAction private func changeDateAction(_ sender: Any) {
        let datetime = selectionDateTimePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: datetime)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = fomartDate
        cacheDate = yourDate ?? Date()
        strDate = formatter.string(from: yourDate!)
    }
    
    @IBAction private func closeButton_Action(_ sender: Any) {
        dimissDatePicker()
    }
    
    private func showDatePicker() {
        weak var wSelf = self
        self.dateTimeDateView.isHidden = false
        UIView.animate(withDuration: 1, animations: {
            guard let mee = wSelf else { return }
            mee.dateTimeDateView.frame = CGRect(x: 0, y: 66, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)//mee.defaultFrame
        }) { (complete) in
            guard let mee = wSelf, complete else { return }
            mee.closeDatePickerView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        }
    }
    
    func dimissDatePicker() {
    
        switch typeButton {
        case .NSX:
            dateOfManuFactireTextField.text = strDate
            dateOfManuFactire = cacheDate
        case .HSD:
            expiryDateTextField.text = strDate
            expiryDate = cacheDate
        default:
            dateOfEntryTextField.text = strDate
            dateOfEntry = cacheDate
        }
        
        self.closeDatePickerView.backgroundColor = UIColor.gray.withAlphaComponent(0.0)
        DispatchQueue.main.async {
            weak var wSelf = self
            UIView.animate(withDuration: 1, animations: {
                guard let mee = wSelf else { return }
                mee.dateTimeDateView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: mee.view.frame.width, height: UIScreen.main.bounds.height)
            }) { (_) in
                guard let mee = wSelf else { return }
                mee.dateTimeDateView.isHidden = true
                self.closeDatePickerView.backgroundColor = UIColor.gray.withAlphaComponent(0.0)
            }
        }
        
    }
    
    private func resetData() {
        namePrTextFeik.text = ""
        manufactorTextFeil.text = ""
        dateOfEntryTextField.text = ""
        dateOfManuFactireTextField.text = ""
        expiryDateTextField.text = ""
        importPriceTextField.text = ""
        priceForSaleTextField.text = ""
        saleOffTextField.text = ""
        pointForSaveTextField.text = ""
        totalProductInPutTextField.text = ""
    }
    
    private func showAlert(success: Bool) {
        alertParentView.isHidden = false
        alertParentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        alertContentView.layer.cornerRadius = 4
        if success {
            alertIconImageView.image = #imageLiteral(resourceName: "checked")
            alertTitleLabel.text = "Đã thêm thành công!."
        } else {
            alertIconImageView.image = #imageLiteral(resourceName: "error")
            alertTitleLabel.text = "Error!. Không thành công."
        }
    }
    
    @IBAction func selectDateButton_Action(_ sender: Any) {
        dimissDatePicker()
    }
    
    @IBAction func cancelButton_Action(_ sender: Any) {
        dimissDatePicker()
    }
    
    @IBAction func hsdDateButton_Action(_ sender: Any) {
        DispatchQueue.main.async {
            self.showDatePicker()
        }
        typeButton = .HSD
    }
    
    @IBAction func NSXDateButton_Action(_ sender: Any) {
        view.endEditing(true)
        showDatePicker()
        typeButton = .NSX
    }
    
    @IBAction func NNDateButton_Action(_ sender: Any) {
        view.endEditing(true)
        showDatePicker()
        typeButton = .NN
    }
    
    @IBAction func closeAlertButton_Action(_ sender: Any) {
        view.endEditing(true)
        alertParentView.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func changeTextFeilImportPrice(_ sender: UITextField) {
        fomartCurency(textFeild: sender)
    }
    
    func fomartCurency(textFeild: UITextField) {
        var text = (textFeild.text ?? "0").replacingOccurrences(of: "₫", with: "")
        text = text.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "")
        if text.count == countTextImportPrice {
            if text.count > 1 {
                text.remove(at: text.index(before: text.endIndex))
            } else {
                text = ""
            }
        }
        countTextImportPrice = text.count
        textFeild.text = fomartCurrency(money: text, wSelf: self).replacingOccurrences(of: "₫", with: "")
    }
    
}
