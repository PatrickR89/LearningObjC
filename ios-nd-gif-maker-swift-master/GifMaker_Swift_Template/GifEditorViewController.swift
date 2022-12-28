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
    @IBOutlet var captionTextField: UITextField!
    var gifUrl: URL? = nil
    var gif: Gif?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

            gifImageView.image = gif?.gifImage
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
