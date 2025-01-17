//
//  ScannerViewController.swift
//  incheon
//
//  Created by DD Dev on 2020/09/14.
//  Copyright © 2020 Incheon Airport. All rights reserved.
//

import UIKit
import AVFoundation

protocol BarcodeDelegate: class {
    func barcodeRead(barcode: String)
}

class ScannerViewController: BaseViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var delegate: BarcodeDelegate?
    
    private let close_utton : UIButton = {
        let button = UIButton()
        button.setTitle("common_close".localized, for: .normal)
        button.setTitleColor(ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.white), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeUtils.titleNumber, weight: UIFont.Weight.regular)
//        button.layer.backgroundColor = ColorUtils.UIColorFromRGB(rgbValue: ColorUtils.blueBackground).cgColor
        //        button.addTarget(self, action: #selector(clickNicknameValid), for: .touchUpInside)
        button.sizeToFit()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseUtils.setMenuAnalyticsEventContent(type: "P", name: String(describing: ScannerViewController.self))
        
        view.backgroundColor = UIColor.black
        
        self.close_utton.addTarget(self, action: #selector(closeThisPage), for: .touchUpInside)
        view.addSubview(self.close_utton)
        self.close_utton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(SizeUtils.topMargin)
            make.trailing.equalToSuperview().offset(-SizeUtils.sideMargin)
        }
        
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.aztec, .code128, .code39, .code39Mod43, .code93, .dataMatrix, .ean13, .ean8, .face, .interleaved2of5, .itf14, .pdf417, .qr, .upce]
//            , .catBody, .dogBody, .humanBody, .salientObject
        } else {
            failed()
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        let previewLayerHeight = self.view.frame.width * 3 / 5
        previewLayer.frame = CGRect(x: 0, y: ((self.view.frame.height / 2) - (previewLayerHeight) / 2), width: self.view.frame.width, height: previewLayerHeight)
        //        previewLayer.frame = CGRect(x: 0, y: (self.view.frame.height / 2) - ((self.view.frame.width * 3 / 5) / 2), width: self.view.frame.width, height: self.view.frame.width * 3 / 5)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }

        dismiss(animated: true)
    }

    func found(code: String) {
        print(code)
        self.delegate?.barcodeRead(barcode: code)
    }
    
    @objc func closeThisPage(){
        self.dismiss(animated: true)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
