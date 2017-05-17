//
//  ShowImageView.swift
//  UITablviewViewCellCustomHeightDemo
//
//  Created by user on 2017/5/16.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import SnapKit

class ShowImageView: UIView {

    private let leadingSpace: Double = 5
    private let topSpace: Double = 5
    private let space: Double = 2.5
    private let imageWith: Double = 90
    private let imageHeight: Double = 90
    private var constraint: Constraint? = nil
    // MARK: - Public method
    func loadImage(array: [UIImage]) {
        if self.subviews.count > 0 {
            for view in self.subviews {
                view.removeFromSuperview()
            }
        }
        for i in 0..<array.count {
            let imageView = UIImageView(image: array[i])
            let row: Double = Double(i/3)
            let x = leadingSpace+(leadingSpace+imageWith)*Double(i%3)
            let y = topSpace + (topSpace + imageHeight)*row
            imageView.frame = CGRect(x: x, y: y, width: imageWith, height: imageHeight)
            imageView.tag = 1000 + i
            self.addSubview(imageView)            
            if 0 == i {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    maker.left.equalTo(strongSelf.leadingSpace)
                    strongSelf.constraint?.deactivate()
                    maker.top.equalTo(strongSelf.snp.top).offset(strongSelf.space)
                    strongSelf.constraint = maker.bottom.equalTo(strongSelf.snp.bottom).offset(-strongSelf.space).constraint
                    maker.width.equalTo(strongSelf.imageWith)
                })
            } else if 3 == i {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    let view = strongSelf.viewWithTag(1000) as! UIImageView
                    maker.left.equalTo(view)
                    strongSelf.constraint?.deactivate()
                    maker.top.equalTo(view.snp.bottom).offset(strongSelf.space)
                    strongSelf.constraint = maker.bottom.equalTo(strongSelf).offset(-strongSelf.space).constraint
                    maker.width.equalTo(strongSelf.imageWith)
                })
            } else if 6 == i {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    let view = strongSelf.viewWithTag(1003) as! UIImageView
                    maker.left.equalTo(view)
                    strongSelf.constraint?.deactivate()
                    maker.top.equalTo(view.snp.bottom).offset(strongSelf.space)
                    strongSelf.constraint = maker.bottom.equalTo(strongSelf).offset(-strongSelf.space).constraint
                    maker.width.equalTo(strongSelf.imageWith)
                })
            } else {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    let view = strongSelf.viewWithTag(1000 + i - 1) as! UIImageView
                    maker.top.equalTo(view.snp.top)
                    maker.left.equalTo(view.snp.right).offset(strongSelf.leadingSpace)
                    maker.width.equalTo(strongSelf.imageWith)
                })
            }
        }
    }
}
