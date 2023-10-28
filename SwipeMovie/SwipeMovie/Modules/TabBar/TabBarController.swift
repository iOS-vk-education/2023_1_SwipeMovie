import UIKit


enum TabBarController {
    
    static func createTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let firstTabBarController = UINavigationController(rootViewController: FilmListViewController())
        firstTabBarController.tabBarItem = UITabBarItem(title: "Списки фильмов", image: UIImage(systemName: "carrot.fill"), tag: 0)
        
        let secondTabBarController = UINavigationController(rootViewController: MainMenuViewController())
        secondTabBarController.tabBarItem = UITabBarItem(title: "Главное меню", image: UIImage(systemName: "drop.degreesign.fill"), tag: 1)
        
        let thirdTabBarController = UINavigationController(rootViewController: HistoryViewController())
        thirdTabBarController.tabBarItem = UITabBarItem(title: "История", image: UIImage(systemName: "person.fill"), tag: 2)
        
        tabBarController.setViewControllers([firstTabBarController,secondTabBarController,thirdTabBarController], animated: true)
        
        
        return tabBarController
    }
    
}
