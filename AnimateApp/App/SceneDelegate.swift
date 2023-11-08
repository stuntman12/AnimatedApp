
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let animatedVc = AnimatedViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = animatedVc
        window?.makeKeyAndVisible()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
    }
}

