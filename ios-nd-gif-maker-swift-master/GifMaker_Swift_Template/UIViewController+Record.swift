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
import AVFoundation

let kFrameCount: Int = 16;
let kDelayTime: Float = 0.2;
let kLoopCount: Int = 0;
let kFrameRate: Int = 15;

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

    func imagePicker(source: UIImagePickerController.SourceType) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.mediaTypes = [UTType.movie.identifier]
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }

    func launchVideoCamera(sender: Any?) {
        let imagePickerController = imagePicker(source: .camera)
        self.present(imagePickerController, animated: true)
    }

    func launchPhotoLibrary() {
        let imagePickerController = imagePicker(source: .photoLibrary)
        self.present(imagePickerController, animated: true)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String

        if mediaType == UTType.movie.identifier {
            let videoURL = info[UIImagePickerController.InfoKey.mediaType] as! URL
            let start = info[UIImagePickerController.InfoKey(rawValue: "_UIImagePickerControllerVideoEditingStart")] as? Float
            let end = info[UIImagePickerController.InfoKey(rawValue: "_UIImagePickerControllerVideoEditingEnd")] as? Float
            var duration: Float?
            if let start = start, let end = end {
                duration = start - end
            } else {
                duration = nil
            }
            self.dismiss(animated: true)
            guard let start = start, let duration = duration else {
                convertVideoToGif(videoURL: videoURL, start: start, duration: duration)
                return
            }
            cropVideoToSquare(videoURL, start, duration)
        }
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }

    // convert to GIF

    func convertVideoToGif(videoURL: URL, start: Float?, duration: Float?) {
        self.dismiss(animated: true)

        let regift: Regift

        if let start = start, let duration = duration {
            regift = Regift(sourceFileURL: videoURL, destinationFileURL: nil, startTime: start, duration: duration, frameRate: kFrameRate, loopCount: kLoopCount)

        } else {
            regift = Regift(sourceFileURL: videoURL, frameCount: kFrameCount, delayTime: kDelayTime, loopCount: kLoopCount)
        }
        let gifURL = regift.createGif()
        let gif = Gif(url: gifURL!, videoUrl: videoURL, caption: nil)
        displayGif(gif)
    }

    func displayGif(_ gif: Gif) {
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gifUrl = gif.url!
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }

    func createPath() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        var outputURL = path+"output"
        do {
            try FileManager().createDirectory(atPath: outputURL, withIntermediateDirectories: false)
        } catch {
            print("error occured during folder creation")
        }
        outputURL += "output.mov"
        do {
            try FileManager().removeItem(atPath: outputURL)
        } catch {
            print("error occured during cleanup of old file(s)")
        }

        return URL(string: outputURL)!
    }

    func cropVideoToSquare(_ rawVideoUrl: URL, _ start: Float, _ duration: Float) {
        let videoAsset = AVAsset(url: rawVideoUrl)
        let videoTrack = videoAsset.tracks(withMediaType: AVMediaType.video)[0]

        let videoComposition = AVMutableVideoComposition()
        videoComposition.renderSize = CGSize(width: videoTrack.naturalSize.width, height: videoTrack.naturalSize.height)
        videoComposition.frameDuration = CMTime(seconds: 1, preferredTimescale: 30)
        let instruction = AVMutableVideoCompositionInstruction()
        instruction.timeRange = CMTimeRangeMake(start: .zero, duration: .init(value: 60, timescale: 30))

        let transformer = AVMutableVideoCompositionLayerInstruction(assetTrack: videoTrack)
        let t1 = CGAffineTransform().translatedBy(x: videoTrack.naturalSize.height, y: -(videoTrack.naturalSize.width - videoTrack.naturalSize.height)/2 ).rotated(by: .pi / 2)
        transformer.setTransform(t1, at: .zero)

        instruction.layerInstructions = [transformer]
        videoComposition.instructions = [instruction]

        let exporter = AVAssetExportSession(asset: videoAsset, presetName: AVAssetExportPresetHighestQuality)
        exporter?.videoComposition = videoComposition
        let path = createPath()
        exporter?.outputURL = path
        exporter?.outputFileType = .mov

        exporter?.exportAsynchronously { [weak self] in
            guard let url = exporter?.outputURL else {return}
            self?.convertVideoToGif(videoURL: url, start: start, duration: duration)
        }
    }
}
