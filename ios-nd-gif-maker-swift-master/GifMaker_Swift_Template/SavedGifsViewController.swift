//
//  SavedGifsViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 09.01.2023..
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class SavedGifsViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var emptyCollection: UIStackView!
    var gifs = [Gif]()
    let cellMargin: CGFloat = 12.0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emptyCollection.isHidden = !gifs.isEmpty
        collectionView.reloadData()


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let tempGifs = try NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: Gif.self, from: Data(contentsOf: FileManager().getGifsDirectory()))
            self.gifs = tempGifs ?? []
            collectionView.reloadData()
        } catch {
            print("error occured while loading files!", error)
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func recordNewVideo(_ sender: Any) {
        presentVideoOptions(sender: sender)
    }
    func initializeCollectionView() {
        collectionView.register(UINib(nibName: "GifCell", bundle: nil), forCellWithReuseIdentifier: "GifCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension SavedGifsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - (cellMargin * 2)) / 2
        let size = CGSize(width: width, height: width)

        return size
    }
}
extension SavedGifsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.gif = gifs[indexPath.item]
        navigationController?.present(detailViewController, animated: true)
        
    }
}
extension SavedGifsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GifCell", for: indexPath) as! GifCell
        let gif = gifs[indexPath.item]
        cell.configureForGif(gif: gif)
        cell.backgroundColor = .cyan
        return cell
    }
}

extension SavedGifsViewController: GifPreviewViewControllerDelegate {
    func previewViewController(_ viewController: GifPreviewViewController, didSaveGif gif: Gif) {
        self.gifs.append(gif)
        do {
            try NSKeyedArchiver.archivedData(withRootObject: gif, requiringSecureCoding: false).write(to: FileManager().getGifsDirectory())
        } catch {
            print("error occured in saving GIF", error)
        }
    }
}
