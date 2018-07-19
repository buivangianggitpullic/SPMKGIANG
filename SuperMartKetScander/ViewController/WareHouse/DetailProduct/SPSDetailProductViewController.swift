//
//  SPSDetailProductViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/11/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

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
    @IBOutlet private weak var dateTimeDateView: UIView!
    @IBOutlet private weak var selectionDateTimePicker: UIDatePicker!
    
    var codeProduct: String = ""
    let realmManager = RealmManager()
    var defaultFrame: CGRect = CGRect.zero
    var strDate: String = ""
    var typeButton: SPSTypeDate = .NN
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dateTimeDateView.isHidden = true
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
    
    @IBAction private func changeDateAction(_ sender: Any) {
        let datetime = selectionDateTimePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: datetime)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MM-yyyy"
        strDate = formatter.string(from: yourDate!)
    }
    
    @IBAction private func closeButton_Action(_ sender: Any) {
        dimissDatePicker()
    }
    
    private func showDatePicker() {
        dateTimeDateView.isHidden = false
        self.closeDatePickerView.backgroundColor = UIColor.gray.withAlphaComponent(0.0)
        weak var wSelf = self
        UIView.animate(withDuration: 1, animations: {
            guard let mee = wSelf else { return }
            mee.dateTimeDateView.frame = mee.defaultFrame
        }) { (complete) in
            guard let mee = wSelf, complete else { return }
            mee.closeDatePickerView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        }
    }
    
    func dimissDatePicker() {
        self.closeDatePickerView.backgroundColor = UIColor.gray.withAlphaComponent(0.0)
        weak var wSelf = self
        UIView.animate(withDuration: 1, animations: {
            guard let mee = wSelf else { return }
            mee.dateTimeDateView.frame = CGRect(x: 0, y: mee.view.frame.height, width: mee.view.frame.width, height: mee.view.frame.height)
        }) { (_) in
            guard let mee = wSelf else { return }
            mee.dateTimeDateView.isHidden = true
            switch mee.typeButton {
            case .NSX:
                mee.dateOfManuFactireTextField.text = mee.strDate
            case .HSD:
                mee.expiryDateTextField.text = mee.strDate
            default:
                mee.dateOfEntryTextField.text = mee.strDate
            }
        }
    }
    
    @IBAction func selectDateButton_Action(_ sender: Any) {
        dimissDatePicker()
    }
    
    @IBAction func cancelButton_Action(_ sender: Any) {
        dimissDatePicker()
    }
    
    @IBAction func hsdDateButton_Action(_ sender: Any) {
        showDatePicker()
        typeButton = .HSD
    }
    
    @IBAction func NSXDateButton_Action(_ sender: Any) {
        showDatePicker()
        typeButton = .NSX
    }
    
    @IBAction func NNDateButton_Action(_ sender: Any) {
        showDatePicker()
        typeButton = .NN
    }
}
