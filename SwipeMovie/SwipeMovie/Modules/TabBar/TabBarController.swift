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
        // fix bug when tabbar color is changing when you scrolling table view
        let tabBarAppeaerance = UITabBarAppearance()
        tabBarAppeaerance.configureWithOpaqueBackground()
        tabBarAppeaerance.backgroundColor = UIColor(named: "tabBarViewColor")
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppeaerance
        UITabBar.appearance().standardAppearance = tabBarAppeaerance
        // fix bug when navbar color is changing when you scrolling table view
//        let navigationBarAppearance = UINavigationBarAppearance()
//        navigationBarAppearance.configureWithOpaqueBackground()
//        navigationBarAppearance.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor(named: "swipeMovieWhite") ?? .white
//        ]
//        navigationBarAppearance.backgroundColor = UIColor(named: "swipeMovieBlue")
//        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
//        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        //
        let tabBarController = UITabBarController()
        let filmListTabBarController = createTabBarController(controller: GenreListViewController(),
                                                              title: "Списки фильмов",
                                                              nameImage: "film.fill",
                                                              tag: 0)
        let mainMenuTabBarController = createTabBarController(controller: MainMenuViewController(),
                                                              title: "Главное меню",
                                                              nameImage: "house.fill",
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
