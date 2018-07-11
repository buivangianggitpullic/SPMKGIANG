//
//  SPSWareHouseViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/10/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

class SPSWareHouseViewController: SPSBaseViewController {

    @IBOutlet private weak var addView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView.setBorder(radius: addView.bounds.width/2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addProductButton_Action(_ sender: Any) {
        let viewVC = SPSAddProductViewController(nibName: "SPSAddProductViewController", bundle: nil)
        self.navigationController?.pushViewController(viewVC, animated: true)
        
//        let viewVC = SPSDetailProductViewController(nibName: "SPSDetailProductViewController", bundle: nil)
//        viewVC.codeProduct = "No code"
//        self.present(viewVC, animated: true, completion: {
//
//        })
    }
}

    


