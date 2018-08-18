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
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Binding
    
    func confgure(withPhoto photo: Photo) {
        descriptionLabel.text = photo.author
        photoImageView.kf.setImage(with: URL(string: photo.thumbUrl()))
    }
}

private extension Photo {
    
    func thumbUrl() -> String {
        return "https://picsum.photos/200/300?image=\(id)"
    }
}
