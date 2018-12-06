//
//  PaymentPage.swift
//  Mojo
//
//  Created by Mithilesh Sinha on 27/09/18.
//  Copyright © 2018 mirab. All rights reserved.
//

import UIKit
import Instamojo
class PaymentPage: UIViewController{
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func payButton(_ sender: Any) {
      let name = nameField.text
      let email = emailField.text
      let phone = phoneField.text
        if(name?.isEmpty)! || (email?.isEmpty)! || (phone?.isEmpty)! {
            let alert = UIAlertController(title: "Alert", message: "Kindly fill all the details", preferredStyle: .alert)
            let ok =  UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)}
            
        else {


            let settingBar = storyboard?.instantiateViewController(withIdentifier: "PayHere") as!
            PayHere
            self.present(settingBar, animated: true)
            
   
            
            
            
            
            
            
            
        }}}
