//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 28.12.2022..
//  Copyright © 2022 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif {
    let url: URL?
    let videoUrl: URL?
    var caption: String?
    let gifImage: UIImage?
    let gifData: Data?

    init (url: URL, videoUrl: URL, caption: String?) {
        self.url = url
        self.videoUrl = videoUrl
        self.caption = caption
        self.gifImage = UIImage.gif(url: url.absoluteString)
        self.gifData = nil
    }

    init (name: String) {
        self.gifImage = UIImage.gif(name: name)
        self.url = nil
        self.videoUrl = nil
        self.caption = nil
        self.gifData = nil
    }
}
