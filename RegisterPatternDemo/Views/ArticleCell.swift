//
//  ArticleCell.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

import UIKit

final class ArticleCell: UITableViewCell, Reusable {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 26) ?? UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor(hex: "#333333") ?? .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "TimesNewRomanPSMT", size: 19) ?? UIFont.systemFont(ofSize: 19)
        label.textColor = UIColor(hex: "#828181") ?? .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor)
        ])
    }
}
