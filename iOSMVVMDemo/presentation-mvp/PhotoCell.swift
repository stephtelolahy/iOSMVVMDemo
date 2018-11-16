//
//  PhotoCell.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell: UITableViewCell {
    
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func confgure(with photo: Photo) {
        descriptionLabel.text = photo.artist
        photoImageView.kf.setImage(with: URL(string: photo.thumbUrl))
    }
}
