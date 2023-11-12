import UIKit

func createTabBarController(controller: UIViewController,
                            title: String?,
                            nameImage: String,
                            tag: Int) -> UINavigationController {
    let tabBarElement = UINavigationController(rootViewController: controller)
    tabBarElement.tabBarItem = UITabBarItem(title: title,
                                            image: UIImage(systemName: nameImage),
                                            tag: tag)
    return tabBarElement
}

final class TabBarController {
    static func createTabBar() -> UITabBarController {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = UIColor(named: "tabBarViewColor")
        let tabBarController = UITabBarController()
        let filmListTabBarController = createTabBarController(controller: FilmListViewController(),
                                                              title: "Списки фильмов",
                                                              nameImage: "film.fill",
                                                              tag: 0)
        let mainMenuTabBarController = createTabBarController(controller: MainMenuViewController(),
                                                              title: "Главное меню",
                                                              nameImage: "checkmark.rectangle.stack",
                                                              tag: 1)
        let historyTabBarController = createTabBarController(controller: HistoryViewController(),
                                                             title: "История",
                                                             nameImage: "clock.fill",
                                                             tag: 2)
        tabBarController.setViewControllers([filmListTabBarController,
                                             mainMenuTabBarController,
                                             historyTabBarController],
                                            animated: true)
        return tabBarController
    }
}
