//
//  DetailViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 10.01.2023..
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var gifImageView: UIImageView!

    var gif: Gif?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gifImageView.image = gif?.gifImage
        // Do any additional setup after loading the view.
    }
    @IBAction func closeSelf(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func shareGif(_ sender: Any) {
        do {
            let url: URL = (gif?.url)!
            let animatedGif = try Data(contentsOf: url)
            let itemsToShare = [animatedGif]

            let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)

            activityViewController.completionWithItemsHandler = { (activity, completed, items, error) in
                if completed {
                    self.navigationController?.popToRootViewController(animated: true)
                }

                if error != nil {
                    print("Error occured on sharing")
                }
            }

            navigationController?.present(activityViewController, animated: true)
        } catch {
            print(error)
        }
        self.dismiss(animated: true)
    }
}
