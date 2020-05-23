//
//  ChallengesModel.swift
//  MehulJadavPractical
//
//  Created by Mehul Jadav on 22/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import ObjectMapper

class ChallengesModel: NSObject,Mappable {

    private let kid                 = "id"
    private let ktitle              = "title"
    private let kimage              = "image"
    private let kdescription        = "description"
    private let kpoints             = "points"
    private let ktype_id            = "type_id"
    private let kcreated_at         = "created_at"
    private let kupdated_at         = "updated_at"
    private let kdeleted_at         = "deleted_at"
    private let kstart_date         = "start_date"
    private let kcompleted          = "completed"
    private let kpublic_image       = "public_image"
    private let kchallenge_type     = "challenge_type"

    
    var id              : Int? = 0
    var title           : String? = ""
    var image           : String? = ""
    var Desc            : String? = ""
    var points          : Int? = 0
    var type_id         : Int? = 0
    var created_at      : String? = ""
    var updated_at      : String? = ""
    var deleted_at      : String? = ""
    var start_date      : String? = ""
    var completed       : Int? = 0
    var public_image    : String? = ""
    var challenge_type  : ChallengesType = ChallengesType()
    
    
    required override init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        
        self.id             <- map[kid]
        self.title          <- map[ktitle]
        self.image          <- map[kimage]
        self.Desc           <- map[kdescription]
        self.points         <- map[kpoints]
        self.type_id        <- map[ktype_id]
        self.created_at     <- map[kcreated_at]
        self.updated_at     <- map[kupdated_at]
        self.deleted_at     <- map[kdeleted_at]
        self.start_date     <- map[kstart_date]
        self.completed      <- map[kcompleted]
        self.public_image   <- map[kpublic_image]
        self.challenge_type <- map[kchallenge_type]

    }
}


class ChallengesType: NSObject,Mappable {

    private let kid         = "id"
    private let ktype       = "type"
    private let kcreated_at = "created_at"
    private let kupdated_at = "updated_at"
    private let kdeleted_at = "deleted_at"
    
    
    var id                  : Int? = 0
    var type                : String? = ""
    var created_at          : String? = ""
    var updated_at          : String? = ""
    var deleted_at          : String? = ""
    
    required override init() {
    }
   
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id                 <- map[kid]
        self.type               <- map[ktype]
        self.created_at         <- map[kcreated_at]
        self.updated_at         <- map[kupdated_at]
        self.deleted_at         <- map[kdeleted_at]
    }
}
