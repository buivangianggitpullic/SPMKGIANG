//
//  SPSBaseBarCodeViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/10/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit
import AVFoundation

class SPSBaseBarCodeViewController: SPSBaseViewController, AVCaptureMetadataOutputObjectsDelegate {

    var videoLayer = AVCaptureVideoPreviewLayer()
    var captureSession: AVCaptureSession = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCamera(viewCamera: UIView) {
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {return}

        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
        }
        catch
        {
            print("======== error")
        }
        
        let outPut = AVCaptureMetadataOutput()
        captureSession.addOutput(outPut)
        
        outPut.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        outPut.metadataObjectTypes = [AVMetadataObject.ObjectType.qr,
                                      AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code39Mod43, AVMetadataObject.ObjectType.code93, AVMetadataObject.ObjectType.code128, AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.aztec, AVMetadataObject.ObjectType.pdf417, AVMetadataObject.ObjectType.itf14, AVMetadataObject.ObjectType.interleaved2of5, AVMetadataObject.ObjectType.dataMatrix, ]
        videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoLayer.frame = viewCamera.frame
        videoLayer.backgroundColor = UIColor.red.cgColor
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        viewCamera.layer.addSublayer(videoLayer)
        
        captureSession.startRunning()
    }
    
    func startScanQRcode() {
        if self.captureSession.isRunning == false {
            self.captureSession.startRunning()
        }
    }
    
    func stopScanQRcode() {
        if self.captureSession.isRunning == true {
            self.captureSession.stopRunning()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }

}
