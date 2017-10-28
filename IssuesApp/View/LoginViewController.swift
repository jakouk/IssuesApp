//
//  LoginViewController.swift
//  IssuesApp
//
//  Created by jakouk on 2017. 10. 28..
//  Copyright © 2017년 jakouk. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {
  let oauth: OAuth2Swift = OAuth2Swift(
    consumerKey: "29747754a37cce63d2c8",
    consumerSecret: "295caa7174132cb44610043bddd568237be5df7d",
    authorizeUrl: "https://github.com/login/oauth/authorize",
    accessTokenUrl: "https://github.com/login/oauth/access_token",
    responseType: "code")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func loginToGithub (_ sender: UIButton) {
    oauth.authorize(
      withCallbackURL: "issuesapp://oauth-callback/github",
      scope: "user,repo",
      state: "state",
      success: { (credential, _, _) in
        let token =  credential.oauthToken
        print("token: \(token)")
    }, failure: { error in
      print(error.localizedDescription)
    })
  }
}
