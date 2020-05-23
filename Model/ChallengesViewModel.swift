//
//  ChallengesViewModel.swift
//  MehulJadavPractical
//
//  Created by Mehul Jadav on 22/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class ChallengesViewModel {
    
    var challengesArr : [ChallengesModel]    = []
 
    
    
    //MARK: - Get Bid List.
    func getChallenges(completion: @escaping (_ success: Bool?, _ error : Error?) -> ()) {
        
        SVProgressHUD.show()
        var param : [String : Any] = [:]
        _ = WebClient.requestWithUrl(url: K.URL.Challenges,parameters: param, method : .get) { (response, error) in
            if error == nil {
                print(response ?? "")
                let dictData = response as! [String : Any]
                let arrData = dictData["data"] as! [String : Any]
                let challenges = arrData["challenges"] as! [[String : Any]]
                
                self.challengesArr = Mapper<ChallengesModel>().mapArray(JSONArray: challenges)
                
                completion(true, nil)
                
            } else {
                ISMessages.show(error?.localizedDescription)
                completion(false, error)
            }
            SVProgressHUD.dismiss()
        }
    }
    
}
