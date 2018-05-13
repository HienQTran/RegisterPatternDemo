//
//  ColorBlockCell.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

import UIKit

final class ColorBlockCell: UITableViewCell, Reusable {
    
    var color: UIColor? {
        didSet {
            self.backgroundColor = color
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
