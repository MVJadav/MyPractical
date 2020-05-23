//
//  UserModel.swift
//  MehulJadavPractical
//
//  Created by Mehul Jadav on 22/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import ObjectMapper

class User: NSObject,Mappable, NSCoding, NSCopying {
//struct User {
    
    private struct SerializationKeys {
        
        static let kid                 = "id"
        static let krole_id            = "role_id"
        static let kfirst_name         = "first_name"
        static let klast_name          = "last_name"
        static let kemail              = "email"
        static let kavatar             = "avatar"
        static let kemail_verified_at  = "email_verified_at"
        static let kpoints             = "points"
        static let kpush_time          = "push_time"
        static let kis_reset_password  = "is_reset_password"
        static let ksettings           = "settings"
        static let kcreated_at         = "created_at"
        static let kupdated_at         = "updated_at"
        static let kname               = "name"
        //static let ktokens             = "tokens"
        
    }
    
    var id                  : Int? = 0
    var roleId              : String? = ""
    var firstName           : String? = ""
    var lastName            : String? = ""
    var email               : String? = ""
    var avatar              : String? = ""
    var emailVerifiedAt     : String? = ""
    var points              : Int? = 0
    var pushTime            : String? = ""
    var isResetPassword     : Int? = 0
    var settings            : String? = ""
    var createdAt           : String? = ""
    var updatedAt           : String? = ""
    var name                : String? = ""
    //var tokens              : [Tokens]! = []
    
    public required override init() {
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        
        self.id                  <- map[SerializationKeys.kid]
        self.roleId              <- map[SerializationKeys.krole_id]
        self.firstName           <- map[SerializationKeys.kfirst_name]
        self.lastName            <- map[SerializationKeys.klast_name]
        self.email               <- map[SerializationKeys.kemail]
        self.avatar              <- map[SerializationKeys.kavatar]
        self.emailVerifiedAt     <- map[SerializationKeys.kemail_verified_at]
        self.points              <- map[SerializationKeys.kpoints]
        self.pushTime            <- map[SerializationKeys.kpush_time]
        self.isResetPassword     <- map[SerializationKeys.kis_reset_password]
        self.settings            <- map[SerializationKeys.ksettings]
        self.createdAt           <- map[SerializationKeys.kcreated_at]
        self.updatedAt           <- map[SerializationKeys.kupdated_at]
        self.name                <- map[SerializationKeys.kname]
        //self.tokens              <- map[SerializationKeys.ktokens]
        
        
    }
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        if let value = self.id { dictionary[SerializationKeys.kid] = value }
        if let value = self.roleId { dictionary[SerializationKeys.krole_id] = value }
        if let value = self.firstName { dictionary[SerializationKeys.kfirst_name] = value }
        if let value = self.lastName { dictionary[SerializationKeys.klast_name] = value }
        if let value = self.email { dictionary[SerializationKeys.kemail] = value }
        if let value = self.avatar { dictionary[SerializationKeys.kavatar] = value }
        if let value = self.emailVerifiedAt { dictionary[SerializationKeys.kemail_verified_at] = value }
        if let value = self.points { dictionary[SerializationKeys.kpoints] = value }
        if let value = self.pushTime { dictionary[SerializationKeys.kpush_time] = value }
        if let value = self.isResetPassword { dictionary[SerializationKeys.kis_reset_password] = value }
        if let value = self.settings { dictionary[SerializationKeys.ksettings] = value }
        if let value = self.createdAt { dictionary[SerializationKeys.kcreated_at] = value }
        if let value = self.updatedAt { dictionary[SerializationKeys.kupdated_at] = value }
        if let value = self.name { dictionary[SerializationKeys.kname] = value }
        //if let value = self.tokens { dictionary[SerializationKeys.ktokens] = value }
        
        
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {

        
        self.id                 = aDecoder.decodeObject(forKey: SerializationKeys.kid) as? Int
        self.roleId             = aDecoder.decodeObject(forKey: SerializationKeys.krole_id) as? String
        self.firstName          = aDecoder.decodeObject(forKey: SerializationKeys.kfirst_name) as? String
        self.lastName           = aDecoder.decodeObject(forKey: SerializationKeys.klast_name) as? String
        self.email              = aDecoder.decodeObject(forKey: SerializationKeys.kemail) as? String
        self.avatar             = aDecoder.decodeObject(forKey: SerializationKeys.kavatar) as? String
        self.emailVerifiedAt    = aDecoder.decodeObject(forKey: SerializationKeys.kemail_verified_at) as? String
        self.points             = aDecoder.decodeObject(forKey: SerializationKeys.kpoints) as? Int
        self.pushTime           = aDecoder.decodeObject(forKey: SerializationKeys.kpush_time) as? String
        self.isResetPassword    = aDecoder.decodeObject(forKey: SerializationKeys.kis_reset_password) as? Int
        self.settings           = aDecoder.decodeObject(forKey: SerializationKeys.ksettings) as? String
        self.createdAt          = aDecoder.decodeObject(forKey: SerializationKeys.kcreated_at) as? String
        self.updatedAt          = aDecoder.decodeObject(forKey: SerializationKeys.kupdated_at) as? String
        self.name               = aDecoder.decodeObject(forKey: SerializationKeys.kname) as? String
        //self.tokens             = aDecoder.decodeObject(forKey: SerializationKeys.ktokens) as? [Tokens]

    }
    
    public func encode(with aCoder: NSCoder) {
        
        
        aCoder.encode(self.id, forKey: SerializationKeys.kid)
        aCoder.encode(self.roleId, forKey: SerializationKeys.krole_id)
        aCoder.encode(self.firstName, forKey: SerializationKeys.kfirst_name)
        aCoder.encode(self.lastName, forKey: SerializationKeys.klast_name)
        aCoder.encode(self.email, forKey: SerializationKeys.kemail)
        aCoder.encode(self.avatar, forKey: SerializationKeys.kavatar)
        aCoder.encode(self.emailVerifiedAt, forKey: SerializationKeys.kemail_verified_at)
        aCoder.encode(self.points, forKey: SerializationKeys.kpoints)
        aCoder.encode(self.pushTime, forKey: SerializationKeys.kpush_time)
        aCoder.encode(self.isResetPassword, forKey: SerializationKeys.kis_reset_password)
        aCoder.encode(self.settings, forKey: SerializationKeys.ksettings)
        aCoder.encode(self.createdAt, forKey: SerializationKeys.kcreated_at)
        aCoder.encode(self.updatedAt, forKey: SerializationKeys.kupdated_at)
        aCoder.encode(self.name, forKey: SerializationKeys.kname)
        //aCoder.encode(self.tokens, forKey: SerializationKeys.ktokens)
        
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = User()

        
        copy.id                          = self.id
        copy.roleId                      = self.roleId
        copy.firstName                   = self.firstName
        copy.lastName                    = self.lastName
        copy.email                       = self.email
        copy.avatar                      = self.avatar
        copy.emailVerifiedAt             = self.emailVerifiedAt
        copy.points                      = self.points
        copy.pushTime                    = self.pushTime
        copy.isResetPassword             = self.isResetPassword
        copy.settings                    = self.settings
        copy.createdAt                   = self.createdAt
        copy.updatedAt                   = self.updatedAt
        copy.name                        = self.name
        //copy.tokens                      = self.tokens
        
        return copy
    }
    
    func save() -> Void {
        StandardUserDefaults.setCustomObject(obj: self, key: K.Key.loggedInUser)
    }
    
    class func delete() -> Void {
        StandardUserDefaults.removeObject(forKey: K.Key.loggedInUser)
        StandardUserDefaults.synchronize()
    }
    
    public static func loggedInUser() -> User? {
        let user  = StandardUserDefaults.getCustomObject(key: K.Key.loggedInUser) as? User
        return user
    }
}


class Tokens: NSObject,Mappable {

    private let kid             = "id"
    private let kuser_id        = "user_id"
    private let kclient_id      = "client_id"
    private let kname           = "name"
    private let kscopes         = "scopes"
    private let krevoked        = "revoked"
    private let kcreated_at     = "created_at"
    private let kupdated_at     = "updated_at"
    private let kexpires_at     = "expires_at"
    
    var id              : String? = ""
    var userId          : Int? = 0
    var clientId        : Int? = 0
    var name            : String? = ""
    var scopes          : String? = ""
    var revoked         : Bool? = false
    var createdAt       : String? = ""
    var updatedAt       : Int? = 0
    var expiresAt       : String? = ""
   
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.id             <- map[kid]
        self.userId         <- map[kuser_id]
        self.clientId       <- map[kclient_id]
        self.name           <- map[kname]
        self.scopes         <- map[kscopes]
        self.revoked        <- map[krevoked]
        self.createdAt      <- map[kcreated_at]
        self.updatedAt      <- map[kupdated_at]
        self.expiresAt      <- map[kexpires_at]
    }
}
