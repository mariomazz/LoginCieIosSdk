//
//  ViewController.swift
//  LoginCie
//
//  Created by Mario Mazzarelli on 07/11/22.
//

import UIKit

class ViewController: UIViewController, CieIdDelegate {
    
    let labelCode = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .white;
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.onDidReceivedLoginEvent(_:)), name: Notification.Name(IDNotificationManager.NOTIFICATION_CENTER_NAME), object: nil)

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
        view.addSubview(labelCode)
        view.addSubview(label)
        
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
    
    @objc private func onDidReceivedLoginEvent(_ notification: Notification) {
        
        if let dict = notification.userInfo as Dictionary? {
                    
            if(dict["code"] != nil && dict["session_state"] != nil){
            
                let code = (dict["code"]!) as! String;
                
                let session_state = (dict["session_state"]!) as! String;
                
                self.showLoginSuccessMessage(code:code)
                
            }
            
        }
            
    }
    
    func showLoginSuccessMessage(code : String){
      
    label.center = CGPoint(x: 160, y: 185)
    label.textAlignment = .center
    label.text = "UTENTE LOGGATO CORRETTAMENTE - CODE"
    label.textColor = .black
    label.numberOfLines = 2

        
    labelCode.center = CGPoint(x: 160, y: 285)
    labelCode.textAlignment = .center
    labelCode.text = code
    labelCode.textColor = .black
    labelCode.numberOfLines = 2
        
    }
    
}




