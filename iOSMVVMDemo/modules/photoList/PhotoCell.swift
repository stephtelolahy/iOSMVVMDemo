//
//  PhotoCell.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    func confgure(withPhoto photo: Photo) {
        self.textLabel?.text = photo.filename
    }
}
