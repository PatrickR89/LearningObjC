//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 28.12.2022..
//  Copyright © 2022 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

extension UIViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    static let kFrameCount: Int = 16;
    static let kDelayTime: Float = 0.2;
    static let kLoopCount: Int = 0;
    static let kFrameRate: Float = 15;

    func launchVideoCamera(sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.mediaTypes = [UTType.movie.identifier]
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String

        if mediaType == UTType.movie.identifier {
            let videoURL = info[UIImagePickerController.InfoKey.mediaType] as! URL
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, nil, nil, nil)
            self.dismiss(animated: true)
        }
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}
