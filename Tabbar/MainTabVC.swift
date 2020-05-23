

import UIKit


class MainTabVC: UITabBarController {

    
    @IBOutlet var IBTabDashboard: UITabBarItem!         = UITabBarItem()
    @IBOutlet var IBTabApplication: UITabBarItem!       = UITabBarItem()
    @IBOutlet var IBTabNotification: UITabBarItem!      = UITabBarItem()
    @IBOutlet var IBTabProfile: UITabBarItem!           = UITabBarItem()
   
    //let edgeInsets : UIEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    //For Select Tabbar
    lazy var selectTab: Int = 0
    static var isDrawer: Bool? = false
    
    //
    static var isUserPaid : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.isNavigationBarHidden = true
        //UINavigationBar.appearance().isHidden = true
        
        //AppUtility.default.navigationController = self.navigationController
        
        //let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "TabbarVC") as! UINavigationController
        //AppUtility.default.navigationController = navigationController
        
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        self.setView()
        
        //self.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //self.navigationController?.isNavigationBarHidden = false
        //AppUtility.default.navigationController?.isNavigationBarHidden = false
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//MARK: setView
extension MainTabVC {
    
    func setView() {
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: AppColor.AppTheme_Primary], for: .selected)
        
        //MARK:- Dashboard View Controller
        let objDashboardVC = App.Storyboard.Main.instantiateVC(ChallengeViewController.self)
        self.IBTabDashboard.image = UIImage(named: TabbarImage.DashboardUnselect)?.withRenderingMode(.alwaysOriginal)
        self.IBTabDashboard.selectedImage = UIImage(named: TabbarImage.DashboardSelect)?.withRenderingMode(.alwaysOriginal)
        objDashboardVC?.tabBarItem = IBTabDashboard
        objDashboardVC?.tabBarItem.tag = 1
        
        //MARK:- Application View Controller
        let objAppVC = App.Storyboard.Main.instantiateVC(RewardsViewController.self)
        self.IBTabApplication.image = UIImage(named: TabbarImage.ApplicationUnselect)?.withRenderingMode(.alwaysOriginal)
        self.IBTabApplication.selectedImage = UIImage(named: TabbarImage.ApplicationSelect)?.withRenderingMode(.alwaysOriginal)
        objAppVC?.tabBarItem = IBTabApplication
        objAppVC?.tabBarItem.tag = 2

        
        //MARK:- Notification View Controller
        let objNotiVC = App.Storyboard.Main.instantiateVC(CommunityViewController.self)
        self.IBTabNotification.image = UIImage(named: TabbarImage.NotificationUnselected)?.withRenderingMode(.alwaysOriginal)
        self.IBTabNotification.selectedImage = UIImage(named: TabbarImage.NotificationSelected)?.withRenderingMode(.alwaysOriginal)
        objNotiVC?.tabBarItem = IBTabNotification
        objNotiVC?.tabBarItem.tag = 3

        //MARK:- Profile View Controller
        let objProfileVC = App.Storyboard.Main.instantiateVC(ProfileViewController.self)
        self.IBTabProfile.image = UIImage(named: TabbarImage.ProfileUnselect)?.withRenderingMode(.alwaysOriginal)
        self.IBTabProfile.selectedImage = UIImage(named: TabbarImage.ProfileSelect)?.withRenderingMode(.alwaysOriginal)
        objProfileVC?.tabBarItem = IBTabProfile
        objProfileVC?.tabBarItem.tag = 4
        
        let navDashboradVC :UINavigationController  = UINavigationController(rootViewController: objDashboardVC!)
        let navAppVC :UINavigationController        = UINavigationController(rootViewController: objAppVC!)
        let navNotiVC :UINavigationController       = UINavigationController(rootViewController: objNotiVC!)
        let navProfileVC :UINavigationController    = UINavigationController(rootViewController: objProfileVC!)

        navDashboradVC.isNavigationBarHidden = true
        navAppVC.isNavigationBarHidden = true
        navNotiVC.isNavigationBarHidden = true
        navProfileVC.isNavigationBarHidden = true
        
        self.viewControllers = [navDashboradVC,navAppVC,navNotiVC,navProfileVC]
        self.selectedIndex = selectTab
        self.delegate = self
        self.setViewControllers(self.viewControllers, animated: true)
        
    }
}

//MARK:- UITabBarControllerDelegate Method
extension MainTabVC : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        /*if viewController.tabBarItem.tag == 2 || viewController.tabBarItem.tag == 3 {
            return false
        }*/
        return true
    }
}

