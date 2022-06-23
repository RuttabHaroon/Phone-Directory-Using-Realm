//
//  NSObject+Extension.swift
//  PhoeNumberListingApp
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import Foundation

extension NSObject {
    static func nameOfClass() -> String {
        return NSStringFromClass(self as AnyClass).components(separatedBy: ".").last!
    }
    var className: String {
        return String(describing: type(of: self))
    }
}
