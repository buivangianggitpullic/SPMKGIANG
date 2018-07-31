//
//  SPSAddProductViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/10/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit
import AVFoundation

class SPSAddProductViewController: SPSBaseBarCodeViewController {

    @IBOutlet private weak var cameraView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Tìm Kiếm Sản Phẩm"
        setUpCamera(viewCamera: cameraView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        startScanQRcode()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//        print("========== outPut = \(output.)")
        for item in metadataObjects {
            print("========== data = \(item)")
        }
        
        if let data = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            self.stopScanQRcode()
            let viewVC = SPSDetailProductViewController(nibName: "SPSDetailProductViewController", bundle: nil)
            viewVC.codeProduct = data.stringValue ?? "No code"
            navigationController?.pushViewController(viewVC, animated: true)
        }
    }
    
}
