import UIKit

func createTabBarController(controller: UIViewController, title: String?, image: String, tag: Int) -> UINavigationController {
    let tabBarElement = UINavigationController(rootViewController: controller)
    tabBarElement.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image), tag: tag)
    return tabBarElement
}

final class TabBarController {
    static func createTabBar() -> UITabBarController {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = UIColor(named: "tabBarViewColor")
        let tabBarController = UITabBarController()
        let filmListTabBarController = createTabBarController(
            controller: FilmListViewController(),
            title: "Списки фильмов",
            image: "film.fill",
            tag: 0)
        let mainMenuTabBarController = createTabBarController(
            controller: MainMenuViewController(),
            title: "Главное меню",
            image: "checkmark.rectangle.stack.fill",
            tag: 1)
        let historyTabBarController = createTabBarController(
            controller: HistoryViewController(),
            title: "История",
            image: "clock.fill",
            tag: 2)
        tabBarController.setViewControllers([
            filmListTabBarController,
            mainMenuTabBarController,
            historyTabBarController],
            animated: true)
        return tabBarController
    }
}
