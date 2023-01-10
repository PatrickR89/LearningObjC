//
//  FileManager+Extension.swift
//  GifMaker_Swift_Template
//
//  Created by Patrick on 10.01.2023..
//  Copyright © 2023 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

extension FileManager {
    func getGifsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path + "/savedGifs"
        let newPath = URL(string: path)!

        return newPath
    }
}
