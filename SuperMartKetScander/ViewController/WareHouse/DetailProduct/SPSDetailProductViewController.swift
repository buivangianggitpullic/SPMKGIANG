//
//  SPSDetailProductViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/11/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

class SPSDetailProductViewController: SPSBaseViewController {

    @IBOutlet weak var heightContentScrollView: NSLayoutConstraint!
    @IBOutlet private
    weak var codeProductTextFeil: UITextField!
    var codeProduct: String = ""
    
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
    
    }
    @IBAction func saveProductButton_Action(_ sender: Any) {
        
    }
    
}
