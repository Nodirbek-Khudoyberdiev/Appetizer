//
//  User.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 09/10/23.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
