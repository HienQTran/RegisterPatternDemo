//
//  ColorBlock.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

struct ColorBlock: Model {
    
    let colorCode: String?
    
    init(colorCode: String?) {
        self.colorCode = colorCode
    }
}

struct ColorBlockParser: Parsable {
    func parse(json: JSON) -> Model? {
        let colorCode = json["color"] as? String
        
        return ColorBlock(colorCode: colorCode)
    }
}
