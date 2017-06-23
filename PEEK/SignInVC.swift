//
//  ViewController.swift
//  PEEK
//
//  Created by Patrick VanVorce on 6/10/17.
//  Copyright © 2017 Maholeycow_Development. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookBtn(_ sender: UIButton) {
      
      let facebookLogin = FBSDKLoginManager()
    
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("PAT: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("PAT: User cancelled Facebook authentication")
            } else {
                print("PAT: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("PAT: Unable to authenticate with Firebase")
            } else {
                print("PAT: Successfully authenticated with Firebase")
            }
        })
    }
}

