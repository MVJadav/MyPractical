//
//  LoginViewModel.swift
//  MehulJadavPractical
//
//  Created by Mehul Jadav on 22/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class UserViewModel {

    private var user = User()
    
    func signIn(email : String, password : String, completion: @escaping (_ result: Bool?) -> Void) {
         
         SVProgressHUD.show()
         var param : [String : Any] = [:]
         param["email"] = email
         param["password"] = password
         
         _ = WebClient.requestWithUrl(url: K.URL.Login, parameters: param) { (response, error) in
             print(response ?? "")
             if error == nil {
                let dictData = response as! [String : Any]
                if let dict = dictData["data"] as? [String : Any], let userInfo = Mapper<User>().map(JSON: dict) {
                    self.user = userInfo
                    self.user.save()
                }
                completion(true)
             } else {
                 completion(false)
                 ISMessages.show(error?.localizedDescription)
             }
             SVProgressHUD.dismiss()
         }
     }
}
