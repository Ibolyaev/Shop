import Crashlytics
import Fabric
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        Fabric.with([Crashlytics.self, Answers.self])
        setupAppearance()
        return true
    }
    
    private func setupAppearance() {
        UITableViewHeaderFooterView.appearance().tintColor = Colors.tint
        UITableView.appearance().tintColor = Colors.tint
    }
}
