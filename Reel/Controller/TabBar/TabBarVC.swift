//
//  TabBarVC.swift
//  Reel
//
//  Created by Chitrala Dhruv on 09/01/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad(){
        super.viewDidLoad()
    
        tabBar.isTranslucent = true
        tabBar.tintColor = .white
        tabBar.barTintColor = #colorLiteral(red: 0.1176470444, green: 0.1176470444, blue: 0.1176470444, alpha: 1)

        let home = UINavigationController(rootViewController: HomeVC())
        let search = UINavigationController(rootViewController: FlowsVC())
        let spaces = UINavigationController(rootViewController: DashboardVC())
        let notification = UINavigationController(rootViewController: CalanderVC())
        let messages = UINavigationController(rootViewController: SettingsVC())
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.07505694777, green: 0.1268905699, blue: 0.1643333137, alpha: 1)
        
        setViewControllers([home,search,spaces,notification,messages], animated: false)
        
        modalPresentationStyle = .fullScreen
        
        guard let items = tabBar.items else {
            return
        }
        
        items[0].image = #imageLiteral(resourceName: "house")
        items[1].image = #imageLiteral(resourceName: "seal")
        items[2].image = #imageLiteral(resourceName: "square.grid.2x2")
        items[3].image = #imageLiteral(resourceName: "calendar")
        items[4].image = #imageLiteral(resourceName: "hexagon")
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
