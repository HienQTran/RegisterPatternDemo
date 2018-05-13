//
//  UIColor+HexInit.swift
//  RegisterPatternDemo
//
//  Created by Hien Quang Tran on 13/5/18.
//  Copyright © 2018 com.hienquangtran.registerpattern. All rights reserved.
//
import UIKit

private var hexRegEx = { try? NSRegularExpression(pattern: "^#{0,1}([A-Fa-f0-9]+)$", options: []) }()

extension UIColor {
    
    // A utility to allow the initialization of UIColor from 3, 6, or 8 character hex strings
    public convenience init?(hex string: String) {
        
        let range = NSRange(location: 0, length: string.count)
        guard
            let regex = hexRegEx,
            let match = regex.firstMatch(in: string, options: [], range: range),
            match.numberOfRanges == 2 else {
                return nil
        }
        let hex = (string as NSString).substring(with: match.range(at: 1))
        
        let alpha: Int?
        let red: Int?
        let green: Int?
        let blue: Int?
        
        switch hex.count {
        case 8:
            
            let alphaRange = hex.index(hex.startIndex, offsetBy: 0)..<hex.index(hex.startIndex, offsetBy: 2)
            let redRange = hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 4)
            let greenRange = hex.index(hex.startIndex, offsetBy: 4)..<hex.index(hex.startIndex, offsetBy: 6)
            let blueRange = hex.index(hex.startIndex, offsetBy: 6)..<hex.index(hex.startIndex, offsetBy: 8)
            
            alpha = Int(String(hex[alphaRange]), radix: 16)
            red = Int(String(hex[redRange]), radix: 16)
            green = Int(String(hex[greenRange]), radix: 16)
            blue = Int(String(hex[blueRange]), radix: 16)
            
        case 6:
            
            let redRange = hex.index(hex.startIndex, offsetBy: 0)..<hex.index(hex.startIndex, offsetBy: 2)
            let greenRange = hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 4)
            let blueRange = hex.index(hex.startIndex, offsetBy: 4)..<hex.index(hex.startIndex, offsetBy: 6)
            
            alpha = 255
            red = Int(String(hex[redRange]), radix: 16)
            green = Int(String(hex[greenRange]), radix: 16)
            blue = Int(String(hex[blueRange]), radix: 16)
            
        case 3:
            
            let redValue = hex[hex.index(hex.startIndex, offsetBy: 0)]
            let greenValue = hex[hex.index(hex.startIndex, offsetBy: 1)]
            let blueValue = hex[hex.index(hex.startIndex, offsetBy: 2)]
            
            alpha = 255
            red = Int("\(redValue)\(redValue)", radix: 16)
            green = Int("\(greenValue)\(greenValue)", radix: 16)
            blue = Int("\(blueValue)\(blueValue)", radix: 16)
            
        default:
            return nil
        }
        
        guard
            let a = alpha,
            let r = red,
            let g = green,
            let b = blue else {
                return nil
        }
        
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255)
    }
}

