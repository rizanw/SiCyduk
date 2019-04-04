//
//  LoginViewController.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/6/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation
import SystemConfiguration

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let URL_API = "https://outclass.ga/?api"
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var NRP_Field: UITextField!
    @IBOutlet weak var Password_Field: UITextField!
    
    @IBAction func tombolLogin(_ sender: UIButton) {
        let parameters: Parameters=[
            "type":"login",
            "username":NRP_Field.text!,
            "passwd":Password_Field.text!,
            "asli":"yes",
            "imei":"12345678910"]
        var headers: HTTPHeaders = [
            "X-CYDUK" : "yes"]
        let user = NRP_Field.text!
        let password = Password_Field.text!
        let credential = URLCredential(user: user, password: password, persistence: .forSession)
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request(URL_API, method: .post, parameters: parameters, headers: headers)
            .authenticate(usingCredential: credential)
            .responseJSON{
            response in
            
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")
            
            if let result = response.result.value{
                let jsonData = result as! NSDictionary
                
                guard let hasil = jsonData.value(forKey: "api_key") as?String
                    else{
                        self.showToast(message: "Masukkan Salah!")
                        //self.view.makeToast("Acount created Successfully", duration: 0.5, position: "bottom")
                        return
                }
                
                if hasil != ""{
                    self.showToast(message: "login success")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = tabBarController
                    myApiKey.api_key=hasil
                    myApiKey.NRPku=self.NRP_Field.text!
                }
            }

        }
    }
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 190, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 4.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NRP_Field.delegate = self
        self.Password_Field.delegate = self
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == NRP_Field) {
            textField.resignFirstResponder()
            Password_Field.becomeFirstResponder()
        }
        else if (textField == Password_Field) {
            textField.resignFirstResponder()
        }
        return (true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (NRP_Field == NRP_Field){
            scrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}
