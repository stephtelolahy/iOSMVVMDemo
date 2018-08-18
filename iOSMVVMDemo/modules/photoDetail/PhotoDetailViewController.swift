//
//  PhotoDetailViewController.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.kf.setImage(with: URL(string: photo.fullUrl()))
    }
}

private extension Photo {
    
    func fullUrl() -> String {
        return "https://picsum.photos/1024?image=\(id)"
    }
}
