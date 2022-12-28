//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 28.12.2022..
//  Copyright © 2022 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {
    @IBOutlet var gifImageView: UIImageView!
    var gifUrl: URL? = nil

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let gifUrl = gifUrl {
            let gifRecording = UIImage.gif(url: gifUrl.absoluteString)
            gifImageView.image = gifRecording
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
