

import Foundation

//MARK:- SqlLite Database Name.
struct DBParameter {
    static let DBName = "Data"
}

//MARK:- Database Table Name
struct DBTableName {
    static let User = "User"
    static let Challenges = "challenges"
}

// MARK: - SQL Query
struct DBQuery {
    
    func select<T>(Obj:T) -> String {
        
        var insertSQl : String = ""
        
        if (Obj is ChallengesModel) {
            //let objAddEditProductPostModel = Obj as! UserModel;
            insertSQl = "Select * from \(DBTableName.Challenges) ORDER BY userId DESC"
        }
        
        return insertSQl
    }
    
    func insert<T>(Obj:T) -> String {
        
        var insertSQl : String = ""
        if (Obj is ChallengesModel) {
            let objUserModel = Obj as! ChallengesModel
            insertSQl = "insert into \(DBTableName.Challenges) (id, title, image, description) values(\"\(objUserModel.id ?? 0)\",\"\(objUserModel.title!)\",\"\(objUserModel.image!)\",\"\(objUserModel.Desc!)\")"
        }
        return insertSQl
    }
    
    
    func update<T>(Obj:T) -> String {
        
        var updateSQl : String = ""
        if (Obj is ChallengesModel) {
            let objUserModel = Obj as! ChallengesModel
            updateSQl = "UPDATE \(DBTableName.Challenges) SET id=\"\(objUserModel.id!)\", title=\"\(objUserModel.title!)\",image=\"\(objUserModel.image!)\",description=\"\(objUserModel.Desc!)\" WHERE userId=\"\(objUserModel.id)\""
        }
        return updateSQl
    }
    
    func delete<T>(Obj:T) -> String {
        var deleteSQl : String = ""
        //ContactModel
        if (Obj is ChallengesModel) {
            let objUserModel = Obj as! ChallengesModel;
            deleteSQl = "Delete FROM \(DBTableName.Challenges) WHERE id = \(objUserModel.id!)"
        }
        return deleteSQl
    }
}
