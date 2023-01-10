//
//  GifCell.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 09.01.2023..
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifCell: UICollectionViewCell {
    @IBOutlet var gifImageView: UIImageView!

    func configureForGif(gif: Gif) {
        self.gifImageView?.image = gif.gifImage
    }
}
