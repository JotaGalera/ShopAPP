import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setInitialViewController()
        return true
    }
    
    func setInitialViewController(){
        let productListViewController = ProductListViewController()
        let navigationController = UINavigationController(rootViewController: productListViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}

