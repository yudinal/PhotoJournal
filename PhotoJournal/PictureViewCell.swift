//
//  PictureViewCell.swift
//  PhotoJournal
//
//  Created by Lilia Yudina on 1/27/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

protocol PictureViewCellDelegate: AnyObject {
    func displaySettings(_ cell: PictureViewCell)
}

class PictureViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var pictureNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var deleteEditButton: UIButton!
    
    weak var delegate: PictureViewCellDelegate?
    
    public func configureCell(_ picture: Picture) {
        pictureNameLabel.text = picture.photoName.capitalized
        dateLabel.text = picture.date
        if let image = UIImage(data: picture.photoData) {
            pictureView.image = image
        } else {
            pictureView.image = UIImage(systemName: "exclamationmark.triangle")
        }
    }
    
    
    @IBAction func editDelete(_ sender: UIButton) {
        delegate?.displaySettings(self)
    }
    
}
