//
//  Ultils.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

import Foundation

extension Bundle {
    static func load(fileName: String, extension ext: String ) -> [JSON] {
        guard
            let fileURL = Bundle.main.url(forResource: fileName, withExtension: ext),
            let data =  try? Data(contentsOf: fileURL),
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSON,
            let items = json?["data"] as? [JSON]
        else { return [] }
        
        return items
    }
}
