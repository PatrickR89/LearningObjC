//
//  GifPreviewViewControllerDelegate.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 10.01.2023..
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation

protocol GifPreviewViewControllerDelegate: AnyObject {
    func previewViewController(_ viewController: GifPreviewViewController, didSaveGif gif: Gif)
}
