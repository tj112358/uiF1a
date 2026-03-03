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
    
    init(standing: String, pts: String, person: String, abrv: String, histno: String) {
        self.standing = standing
        self.pts = pts
        self.person = person
        self.abrv = abrv
        self.histno = histno
    }
    
}
