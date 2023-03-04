
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemsColor()
    }
    
    func setItemsColor() {
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.customLightGreen()], for: .normal)
//
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.customDarkBlue()], for: .selected)
        
        UITabBar.appearance().tintColor = UIColor.customBlue()
        UITabBar.appearance().unselectedItemTintColor = UIColor.customLightGreen()
        //UITabBar.appearance().barTintColor = UIColor.customLightGreen()
        
        
//        if #available(iOS 13, *) {
//            let appearance = UITabBarAppearance()
//            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customLightGreen()]
//            tabBar.standardAppearance = appearance
//            // Update for iOS 15, Xcode 13
//            if #available(iOS 15.0, *) {
//                tabBar.scrollEdgeAppearance = appearance
//            }
//        }
    }
}
