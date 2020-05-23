
import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

public let BASE_URL     = "https://my-momentum-staging.herokuapp.com/api/"

struct K {

    struct Key {
        
        static let data                         = "data"
        static let loggedInUser                 = "kLoggedInUserKey"
        static let deviceToken                  = "kDeviceToken"
        
        static let jobCreation                 = "kJobCreation"
        
        static let kStateCity = "kStateCity"
        
    }
    
    struct URL {
        static let Login        = BASE_URL + "login"
        static let Challenges   = BASE_URL + "get_challenges"
        
    }
        
}

struct AppColor {

    //App Theme Status Bar
    static let Statusbar_Primary        = UIColor(red: 105/255, green: 198/255, blue: 192/255, alpha: 0.7)

    //App Theme
    static let AppTheme_Primary         = UIColor(red: 105/255, green: 198/255, blue: 192/255, alpha: 1.0)
    static let AppTheme_Secondary       = UIColor(red: 255/255, green: 51/255, blue: 102/255, alpha: 0.5)
    static let WhatsAppColor         = UIColor(red: 89/255, green: 154/255, blue: 30/255 , alpha :1)
    static let Light_Grey       = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.5)
}

struct TabbarImage {
    
    static let DashboardSelect          = "bottom_dashboard_s"
    static let DashboardUnselect        = "bottom_dashboard"
    
    static let ApplicationSelect        = "bottom_application_s"
    static let ApplicationUnselect      = "bottom_application"
    
    static let NotificationSelected     = "bottom_notification_s"
    static let NotificationUnselected   = "bottom_notification"
    
    static let ProfileSelect            = "bottom_profile_s"
    static let ProfileUnselect          = "bottom_profile"
    
}
struct App {
    
    struct Storyboard {
        static let Main = UIStoryboard(name: "Main", bundle: nil)
    }
}
