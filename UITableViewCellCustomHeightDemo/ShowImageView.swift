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

    private var leadingSpace: CGFloat = 5
    private let topSpace: CGFloat = 5
    private let space: CGFloat = 2.5
    private var imageWith: CGFloat = 100
    private var imageHeight: CGFloat = 100
    private var constraint: Constraint? = nil
    /*
     * 用来标识第二行第一个是几张图片
     * 总数大于4时第二行起始图片是第4张（3）
     * 总数等于4时第二行起始图片是第三张（2）
     * 总数小于4时没有第二行
     * 默认为 3
     */
    private var flagNum: Int = 3
    /*
     * 每行有几列
     * 总数 > 4 或者 < 4 时，3列
     * 总数 == 4 时，2列
     * 默认为 3
     */
    
    
    // MARK: - Public method
    /*
     * 计算横向每个图片间的空隙，每行展示3个
     */
    private func caculatorHorizontalSpaceAndWidht(_ imageSize: CGSize?) {
        
        let selfWidth = self.frame.size.width
        if let _ = imageSize {
            imageWith = imageSize!.width
            imageHeight = imageSize!.height
        }
        leadingSpace = (selfWidth - imageWith*3)/4
    }
    
    
    func loadImage(array: [UIImage]) {
        if self.subviews.count > 0 {
            for view in self.subviews {
                view.removeFromSuperview()
            }
        }
        caculatorHorizontalSpaceAndWidht(nil)
        if array.count == 4 {
            flagNum = 2
        }
        for i in 0..<array.count {
            let imageView = UIImageView(image: array[i])
            let row: CGFloat = CGFloat(i/flagNum)
            let x = leadingSpace+(leadingSpace+imageWith)*CGFloat(i%flagNum)
            let y = topSpace + (topSpace + imageHeight)*row
            imageView.frame = CGRect(x: x, y: y, width: imageWith, height: imageHeight)
            imageView.tag = 1000 + i
            self.addSubview(imageView)            
            if 0 == i {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    maker.left.equalTo(strongSelf.leadingSpace)
                    maker.top.equalTo(strongSelf.snp.top).offset(strongSelf.space)
                    strongSelf.constraint = maker.bottom.equalTo(strongSelf.snp.bottom).offset(-strongSelf.space).constraint
                    maker.width.equalTo(strongSelf.imageWith)
                    maker.height.lessThanOrEqualTo(strongSelf.imageHeight)
                })
            } else if flagNum == i {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    let view = strongSelf.viewWithTag(1000) as! UIImageView
                    maker.left.equalTo(view)
                    if strongSelf.constraint != nil {
                        strongSelf.constraint?.deactivate()
                    }
                    maker.top.equalTo(view.snp.bottom).offset(strongSelf.space)
                    strongSelf.constraint = maker.bottom.equalTo(strongSelf).offset(-strongSelf.space).constraint
                    maker.width.equalTo(strongSelf.imageWith)
                    maker.height.lessThanOrEqualTo(strongSelf.imageHeight)
                })
            } else if 6 == i {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    let view = strongSelf.viewWithTag(1003) as! UIImageView
                    maker.left.equalTo(view)
                    if strongSelf.constraint != nil {
                        strongSelf.constraint?.deactivate()
                    }
                    maker.top.equalTo(view.snp.bottom).offset(strongSelf.space)
                    strongSelf.constraint = maker.bottom.equalTo(strongSelf).offset(-strongSelf.space).constraint
                    maker.width.equalTo(strongSelf.imageWith)
                    maker.height.lessThanOrEqualTo(strongSelf.imageHeight)
                })
            } else {
                imageView.snp.makeConstraints({ [weak self] (maker) in
                    guard let strongSelf = self else { return }
                    let view = strongSelf.viewWithTag(1000 + i - 1) as! UIImageView
                    maker.top.equalTo(view.snp.top)
                    maker.left.equalTo(view.snp.right).offset(strongSelf.leadingSpace)
                    maker.width.equalTo(strongSelf.imageWith)
                    maker.height.lessThanOrEqualTo(strongSelf.imageHeight)
                })
            }
        }
    }
}
