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

let kFrameCount: Int = 16;
let kDelayTime: Float = 0.2;
let kLoopCount: Int = 0;
let kFrameRate: Float = 15;

extension UIViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    func presentVideoOptions(sender: Any) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            launchPhotoLibrary()
        } else {
            let newGifActionSheet = UIAlertController(title: "Create new gif", message: nil, preferredStyle: .actionSheet)

            let recordVideo = UIAlertAction(title: "Record video", style: .default, handler: { _ in
                self.launchVideoCamera(sender: sender)
            })

            let chooseFromExisting = UIAlertAction(title: "Choose from existing", style: .default, handler: { _ in
                 self.launchPhotoLibrary()
            })

            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            newGifActionSheet.addAction(recordVideo)
            newGifActionSheet.addAction(chooseFromExisting)
            newGifActionSheet.addAction(cancel)

            self.present(newGifActionSheet, animated: true)

            let pinkColor = UIColor(red: 255.0/255.0, green: 65.0/255.0, blue: 112.0/255.0, alpha: 1.0)
            newGifActionSheet.view.tintColor = pinkColor
        }
    }

    func launchVideoCamera(sender: Any?) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.mediaTypes = [UTType.movie.identifier]
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true)
    }

    func launchPhotoLibrary() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.mediaTypes = [UTType.movie.identifier]
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String

        if mediaType == UTType.movie.identifier {
            let videoURL = info[UIImagePickerController.InfoKey.mediaType] as! URL
//            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, nil, nil, nil)
            self.dismiss(animated: true)
            convertVideoToGif(videoURL: videoURL)
        }
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }

    // convert to GIF

    func convertVideoToGif(videoURL: URL) {
        let regift = Regift(sourceFileURL: videoURL, frameCount: kFrameCount, delayTime: kDelayTime, loopCount: kLoopCount)
        let gifURL = regift.createGif()
        let gif = Gif(url: gifURL!, videoUrl: videoURL, caption: nil)
        displayGif(gif)
    }

    func displayGif(_ gif: Gif) {
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gifUrl = gif.url!
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
}
