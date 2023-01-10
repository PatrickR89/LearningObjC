//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 28.12.2022..
//  Copyright © 2022 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

enum GifProps: String {
    case url = "url"
    case videoUrl = "videoUrl"
    case caption = "caption"
    case gifImage = "gifImage"
    case gifData = "gifData"
}

class Gif: NSObject, NSCoding {

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

    func encode(with coder: NSCoder) {
        coder.encode(self.url, forKey: GifProps.url.rawValue)
        coder.encode(self.videoUrl, forKey: GifProps.videoUrl.rawValue)
        coder.encode(self.caption, forKey: GifProps.caption.rawValue)
        coder.encode(self.gifImage, forKey: GifProps.gifImage.rawValue)
        coder.encode(self.gifData, forKey: GifProps.gifData.rawValue)
    }

    required init?(coder: NSCoder) {
        self.url = coder.decodeObject(forKey: GifProps.url.rawValue) as! URL?
        self.videoUrl = coder.decodeObject(forKey: GifProps.videoUrl.rawValue) as! URL?
        self.caption = coder.decodeObject(forKey: GifProps.caption.rawValue) as! String?
        self.gifImage = coder.decodeObject(forKey: GifProps.gifImage.rawValue) as! UIImage?
        self.gifData = coder.decodeObject(forKey: GifProps.gifData.rawValue) as! Data?
    }
}
