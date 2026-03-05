//
//  Driver.swift
//  uiF1a
//
//  Created by Thea Yocum on 3/2/26.
//

import Foundation
import SwiftData

@Model
class Queen {
    var standing: String = ""
    var pts: String = ""
    var person: String = ""
    var abrv: String = ""
    var histno: String = ""
    
    var firstName: String
    var lastName: String
    var image: String
    var flag: String
    var carno: String
    
    init(standing: String, pts: String, person: String, abrv: String, histno: String, firstName: String, lastName: String, image: String, flag: String, carno: String) {
        self.standing = standing
        self.pts = pts
        self.person = person
        self.abrv = abrv
        self.histno = histno
        
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.flag = flag
        self.carno = carno
    }
    
}
