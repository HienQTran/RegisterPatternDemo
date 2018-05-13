//
//  Article.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//
import Foundation

struct Article: Model {

    let title: String?
    let description: String?
    
    init(title: String?, description: String?) {
        self.title = title
        self.description = description
    }
}

struct ArticleParser: Parsable {
    
    init() {}
    
    func parse(json: JSON) -> Model? {
        let title = json["title"] as? String
        let description = json["description"] as? String
        
        return Article(title: title, description: description)
    }
}
