//
//  SPSQRScannerViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/10/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

class SPSQRScannerViewController: SPSBaseBarCodeViewController {

    @IBOutlet private weak var cameraView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCamera(viewCamera: cameraView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
