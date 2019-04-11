//
//  itunesTableViewCell.swift
//  GeniusPlazaCodeChallegnge
//
//  Created by Kadeem Palacios on 4/11/19.
//  Copyright © 2019 Kadeem Palacios. All rights reserved.
//

import UIKit

class itunesTableViewCell: UITableViewCell {
    lazy var containerView:UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width, height: self.frame.height - 5))
        view.backgroundColor = UIColor.lightGray
        return view
    }()

    lazy var imageCover:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: self.containerView.frame.midY, width: 70, height: 70))
        imageView.center = CGPoint(x: imageView.frame.height/2 + 10, y: self.containerView.frame.midY - 10)
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()

    lazy var titleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: self.imageCover.frame.maxX + 10, y: self.imageCover.frame.minY + 5, width: 250, height: 20))
        label.backgroundColor = UIColor.blue
        return label
    }()
    lazy var descriptionLabel:UILabel = {
        let label = UILabel(frame: CGRect(x: self.imageCover.frame.maxX + 10, y: self.imageCover.frame.maxY - self.titleLabel.frame.height - 5, width: 250, height: 20))
        label.backgroundColor = UIColor.red
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(containerView)
        containerView.addSubview(imageCover)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        // Configure the view for the selected state
    }

}
