//
//  ParserManager.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 13/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

class ParserManager {
    var registry: [String : Parsable] = [:]
    
    init() {}
    
    func register(id: String, type: Parsable) {
        guard registry[id] == nil else {
            fatalError("\(id) is already registered. Consider choosing a different name")
        }
        
        registry[id] = type
    }
    
    func parser(for id: String) -> Parsable? {
        guard let parser = registry[id] else {
            //Warning
            print("⚠️ There is no parser registed with the id `\(id)`")
            return nil
        }
        
        return parser
    }
    
    func parser(for json: JSON) -> Parsable? {
        guard let type = json["type"] as? String else {
            print("⚠️ There is no `type` associated with this json")
            return nil
        }
    
        return parser(for: type)
    }
}
