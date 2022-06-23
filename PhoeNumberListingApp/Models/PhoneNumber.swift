//
//  PhoneNumber.swift
//  PhoeNumberListingApp
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import Foundation
import RealmSwift

class PhoneNumber : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var phone : String = ""
    
    //int float double and other number types optinal value are handled like this acciording to realm doc
    //let score = RealmOptional<Int>()
    
    //optional string are handled like this in realm
    //@objc var email: String? = nil
    
    convenience init(name: String, phone: String) {
        self.init()
        self.name = name
        self.phone = phone
    }
    
}

