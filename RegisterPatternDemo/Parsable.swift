//
//  Parsable.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 9/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//

protocol Model {}

protocol Parsable {
    func parse(json: JSON) -> Model?
}
