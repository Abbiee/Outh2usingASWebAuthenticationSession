//
//  ViewController.swift
//  StarvOauth2iOS
//
//  Created by Abbie on 01/01/21.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController,ASWebAuthenticationPresentationContextProviding {
    private var authSession: ASWebAuthenticationSession?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func authenticateAction(_ sender: Any) {
        
        authenticate()
    }
    func authenticate()
        {
            let string = self.createWebAuthUrl()
            NSLog(string)
            guard let url = URL(string: string) else { return }

            self.authSession = ASWebAuthenticationSession(url: url, callbackURLScheme: "backtoapp://", completionHandler:
            {
                url, error in

            })

            self.authSession!.presentationContextProvider = self

            self.authSession?.start()
        }

        fileprivate func createWebAuthUrl() -> String
        {
            var url = String.init()

            url.append("https://www.strava.com/oauth/mobile/authorize")
            url.append("?client_id=59097")
            url.append("&redirect_uri=backtoapp://best.com")
            url.append("&response_type=code")
            url.append("&approval_prompt=force")
            url.append("&grant_type=authorization_code")
            url.append("&scope=activity:write,activity:read_all")

            return url
        }

        func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
            print(session)
            return view.window!
        }
    }


