//
//  ScanerViewController.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 06/07/2023.
//

import UIKit
import AVFoundation

class ScanerViewController: UIViewController {
//    var captureSession: AVCaptureSession!
//    var previewLayer: AVCaptureVideoPreviewLayer!

       override func viewDidLoad() {
           super.viewDidLoad()
           
           Colors.getBackground(view: view)
//           captureSession = AVCaptureSession()
//
//           guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
//           let videoInput: AVCaptureDeviceInput
//
//           do {
//               videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
//           } catch {
//               return
//           }
//
//           if (captureSession.canAddInput(videoInput)) {
//               captureSession.addInput(videoInput)
//           } else {
//               failed()
//               return
//           }
//           //Initialize an AVCaptureMetadataOutput object and set it as the output device to the capture session.
//           let metadataOutput = AVCaptureMetadataOutput()
//
//           if (captureSession.canAddOutput(metadataOutput)) {
//               captureSession.addOutput(metadataOutput)
//               //Set delegate and use default dispatch queue to execute the call back
//               metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//               metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
//           } else {
//               failed()
//               return
//           }
//           //Initialize the video preview layer and add it as a sublayer.
//           previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//           previewLayer.frame = view.layer.bounds
//           previewLayer.videoGravity = .resizeAspectFill
//           view.layer.addSublayer(previewLayer)
//           //Start video capture
//           captureSession.startRunning()
//       }
//
//       func failed() {
//           let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
//           ac.addAction(UIAlertAction(title: "OK", style: .default))
//           present(ac, animated: true)
//           captureSession = nil
//       }
//
//       override func viewWillAppear(_ animated: Bool) {
//           super.viewWillAppear(animated)
//
//           if (captureSession?.isRunning == false) {
//               captureSession.startRunning()
//           }
//       }
//
//       override func viewWillDisappear(_ animated: Bool) {
//           super.viewWillDisappear(animated)
//
//           if (captureSession?.isRunning == true) {
//               captureSession.stopRunning()
//           }
//       }
//
//       func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//           captureSession.stopRunning()
//
//           if let metadataObject = metadataObjects.first {
//               guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
//               guard let stringValue = readableObject.stringValue else { return }
//               AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
//               found(code: stringValue)
//           }
//
//           dismiss(animated: true)
//       }
//
//       func found(code: String) {
//           print(code)
//       }
//
//       override var prefersStatusBarHidden: Bool {
//           return true
//       }
//
//       override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//           return .portrait
       }
   }
