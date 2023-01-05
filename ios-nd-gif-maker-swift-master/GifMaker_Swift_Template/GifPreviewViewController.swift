//
//  GifPreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 05.01.2023..
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifPreviewViewController: UIViewController {

    var gif: Gif?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    }
}
