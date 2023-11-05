import UIKit

func createTabBarController(UIViewController: UIViewController, title: String?, image: UIImage?, tag: Int) -> UINavigationController {
    let tabBarElement = UINavigationController(rootViewController: UIViewController)
    tabBarElement.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
    return tabBarElement
}

enum TabBarController {
    static func createTabBar() -> UITabBarController {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = UIColor(named: "tabBarViewColor")
        let tabBarController = UITabBarController()
        let filmListTabBarController = createTabBarController(UIViewController: FilmListViewController(), title: "Списки фильмов", image: UIImage(systemName: "film.fill"), tag: 0)
        let mainMenuTabBarController = createTabBarController(UIViewController: MainMenuViewController(), title: "Главное меню", image: UIImage(systemName: "checkmark.rectangle.stack.fill"), tag: 1)
        let historyTabBarController = createTabBarController(UIViewController: HistoryViewController(), title: "История", image: UIImage(systemName: "clock.fill"), tag: 2)
        tabBarController.setViewControllers([filmListTabBarController,
                                             mainMenuTabBarController,
                                             historyTabBarController], animated: true)
        return tabBarController
    }
}
