//
//  ImageCell.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

import UIKit

final class ImageCell: UITableViewCell, Reusable {
    
    var thumbnailImage: UIImage! {
        didSet {
            thumbnail.image = thumbnailImage
        }
    }
    
    private lazy var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(thumbnail)
        
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            thumbnail.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            thumbnail.heightAnchor.constraint(equalToConstant: 100),
            thumbnail.widthAnchor.constraint(equalTo: thumbnail.heightAnchor, multiplier: 1.3),
            thumbnail.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
