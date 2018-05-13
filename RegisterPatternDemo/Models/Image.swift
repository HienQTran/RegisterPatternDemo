//
//  Image.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

struct Image: Model {
    
    let imageURL: String?
    
    init(imageURL: String?) {
        self.imageURL = imageURL
    }
}

struct ImageParser: Parsable {
    func parse(json: JSON) -> Model? {
        let imageURL = json["imageUrl"] as? String
        
        return Image(imageURL: imageURL)
    }
}
