//
//  ListViewModel.swift
//  UITablviewViewCellCustomHeightDemo
//
//  Created by user on 2017/5/16.
//  Copyright © 2017年 user. All rights reserved.
//

import Foundation
import HandyJSON

class ListViewModel: HandyJSON {
    
    var title: String?
    var description: String?
    var images: Array<Any>?
    var time: String?
    
    required init(){}
    
    var defaultHeight: CGFloat {
        if (images?.count)! > 0 {
            return 206
        } else {
            return 106
        }
    }
}
