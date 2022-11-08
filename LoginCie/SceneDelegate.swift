//
//  SceneDelegate.swift
//  LoginCie
//
//  Created by Mario Mazzarelli on 07/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {

        guard let url = URLContexts.first?.url else {

            return

        }

        var urlString : String = String(url.absoluteString)
        if let httpsRange = urlString.range(of: "https://"){

        //Rimozione del prefisso dell'URL SCHEME
        let startPos = urlString.distance(from: urlString.startIndex, to: httpsRange.lowerBound)
        urlString = String(urlString.dropFirst(startPos))

        //Passaggio dell'URL alla WebView
        let response : [String:String] = ["payload": urlString]
        let NOTIFICATION_NAME : String = "RETURN_FROM_CIEID"

        NotificationCenter.default.post(name: Notification.Name(NOTIFICATION_NAME), object: nil, userInfo: response)

        }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        Logger.log(data:scene.subtitle);
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        Logger.log(data:scene.subtitle);
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        Logger.log(data:scene.subtitle);
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        Logger.log(data:scene.subtitle);
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        Logger.log(data:scene.subtitle);
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

