//
//  Shot.swift
//  JetDribble
//
//  Created by Alex on 12/21/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class Shot: Object, Mappable  {
    
    dynamic var title:String = ""
    dynamic var text:String = ""
    var animated:Bool = true
    dynamic var imageHidpiURL:String?
    dynamic var imageNormalURL:String?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.text <- map["description"]
        self.animated <- map["animated"]
        self.imageHidpiURL <- map["images.hidpi"]
        self.imageNormalURL <- map["images.normal"]
    }
}

