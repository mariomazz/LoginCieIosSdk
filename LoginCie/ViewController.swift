//
//  ViewController.swift
//  LoginCie
//
//  Created by Mario Mazzarelli on 07/11/22.
//

import UIKit

class ViewController: UIViewController, CieIdDelegate {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white;
        
        
        let mainButton = CieIDButton(frame: CGRectMake(0, 0, 265, 80));
        mainButton.prepareForInterfaceBuilder()
        mainButton.center = view.center;
        mainButton.addAction(for: .touchUpInside) {
           
            let cieIDAuthenticator = CieIDWKWebViewController()
            cieIDAuthenticator.modalPresentationStyle = .fullScreen
            cieIDAuthenticator.delegate = self
            self.present(cieIDAuthenticator, animated: true, completion: nil)
            
        }
       
        view.addSubview(mainButton)
        
    }
   
    func  CieIDAuthenticationClosedWithSuccess() {

        Logger.log(data:"Authentication closed with SUCCESS")

    }
    
    func  CieIDAuthenticationCanceled() {
        
        Logger.log(data:"L'utente ha annullato l'operazione")
            
    }
    
    func  CieIDAuthenticationClosedWithError(errorMessage: String) {

        Logger.log(data:"ERROR MESSAGE: \(errorMessage)")

    }
    
}




