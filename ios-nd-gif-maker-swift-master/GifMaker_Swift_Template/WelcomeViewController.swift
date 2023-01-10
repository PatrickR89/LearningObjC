//
//  WelcomeViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 28.12.2022..
//  Copyright © 2022 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var gifImageView: UIImageView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let conceptGif = UIImage.gif(name: "hotlineBling")
        gifImageView.image = conceptGif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "WelcomeScreenSeen")
        // Do any additional setup after loading the view.
    }
    @IBAction func launchVideoCamera(_ sender: Any) {
        self.presentVideoOptions(sender: sender)
    }
}
