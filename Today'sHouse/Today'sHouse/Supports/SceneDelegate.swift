//
//  SceneDelegate.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let homeVC = HomeViewController()
        let storeVC = StoreViewController()
        let interiorVC = InteriorViewController()
        let myPageVC = MyPageViewController()
        let plusVC = PlusViewController()
        let plusButton = UIButton()
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "map"), tag: 0)
        storeVC.tabBarItem = UITabBarItem(title: "스토어", image: UIImage(systemName: "cart.badge.plus"), tag: 0)
        interiorVC.tabBarItem = UITabBarItem(title: "인테리어시공", image: UIImage(systemName: "person"), tag: 0)
        myPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person"), tag: 0)
//        plusVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "PlusButton"), tag: 0)
        plusVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.more, tag: 0)

        let plusNavigation = UINavigationController(rootViewController: plusVC)
        let tabBarController = UITabBarController()
        let homeNavigation = UINavigationController(rootViewController: homeVC)
        let storeNavigation = UINavigationController(rootViewController: storeVC)
        tabBarController.viewControllers = [homeNavigation, storeNavigation, interiorVC, myPageVC, plusNavigation]
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

