//
//  ListTableViewCell.swift
//  UITablviewViewCellCustomHeightDemo
//
//  Created by user on 2017/5/16.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var showImageView: ShowImageView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public method
    func loadCellWithModel(model: ListViewModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        timeLabel.text = model.time
        showImageView.loadImage(array: model.images as! [UIImage])
    }
}
