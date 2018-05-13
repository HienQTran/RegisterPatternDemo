//
//  MainViewModel.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 10/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

import UIKit

struct MainViewModel {
    
    private let parserManager = ParserManager()
    
    private let data: [JSON]
    
    var numberOfItems: Int {
        return data.count
    }
    
    init(data: [JSON]) {
        self.data = data
        
        parserManager.register(id: "article", type: ArticleParser())
        parserManager.register(id: "image", type: ImageParser())
        parserManager.register(id: "color-block", type: ColorBlockParser())
    }
}

// MARK:
extension MainViewModel {
    private func item(at indexPath: IndexPath) -> Model? {
        let json = data[indexPath.row]
        guard let parser = parserManager.parser(for: json) else { return nil }
        return parser.parse(json: json)
    }
    
    func cell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let item = item(at: indexPath) else { return UITableViewCell() }
        
        switch item {
        case let article as Article:
            let cell = tableView.dequeueReusableCell(for: indexPath) as ArticleCell
            cell.titleLabel.text = article.title
            cell.descriptionLabel.text = article.description
            return cell
        case let image as Image:
            let cell = tableView.dequeueReusableCell(for: indexPath) as ImageCell
            cell.thumbnailImage = UIImage(named: "crusty")
            return cell
        case let colorBlock as ColorBlock:
            let cell = tableView.dequeueReusableCell(for: indexPath) as ColorBlockCell
            cell.color = UIColor(hex: colorBlock.colorCode ?? "") ?? .red
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
}
