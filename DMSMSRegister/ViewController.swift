//
//  ViewController.swift
//  DMSMSRegister
//
//  Created by Masuhara on 2016/06/21.
//  Copyright © 2016年 net.maushara. All rights reserved.
//

import UIKit
import DigitsKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session, error) in
            if (session != nil) {
                // TODO: associate the session userID with your user model
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: .none))
                self.present(alertController, animated: true, completion: .none)
            }else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        })
        
        authButton!.center = self.view.center
        self.view.addSubview(authButton!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapButton(sender: AnyObject) {
        let digits = Digits.sharedInstance()
        let configuration = DGTAuthenticationConfiguration(accountFields: .defaultOptionMask)
        configuration?.phoneNumber = "+81"
        digits.authenticate(with: nil, configuration: configuration!) { session, error in
            // Country selector will be set to Japan
        }
    }
}

