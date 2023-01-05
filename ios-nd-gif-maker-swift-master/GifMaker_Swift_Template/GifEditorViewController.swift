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
        subscribeToKeyboardNotifications()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotification()
    }
}

extension GifEditorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
    }
}

extension GifEditorViewController {
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func unsubscribeFromKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if view.frame.origin.y >= 0 {
            view.frame.origin.y -= getKeyboardHeight(notification: notification)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y < 0 {
            view.frame.origin.y += getKeyboardHeight(notification: notification)
        }
    }

    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
}
