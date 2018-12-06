//
//  PayHere.swift
//  Mojo
//
//  Created by Mithilesh Sinha on 02/12/18.
//  Copyright © 2018 mirab. All rights reserved.
//

import UIKit
import Instamojo

class PayHere: UIViewController, OrderRequestCallBack{
    
    
    func fetchOrder(orderID: String, accessToken: String){
        //show spinner
        let request = Request.init(orderID: "Order Id here", accessToken: "Access Token Here",  orderRequestCallBack: self)
        request.execute()
    }
    
    
    override func viewDidLoad() {
        
       addNotificationToRecievePaymentCompletion()
        super.viewDidLoad()
    }
    
    
    
    func addNotificationToRecievePaymentCompletion(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.paymentCompletionCallBack), name: NSNotification.Name("INSTAMOJO"), object: nil)
    }
    
    
    @objc func paymentCompletionCallBack() {
        if UserDefaults.standard.value(forKey: "USER-CANCELLED") != nil {
            //Transaction cancelled by user, back button was pressed
        }
        if UserDefaults.standard.value(forKey: "ON-REDIRECT-URL") != nil {
            // Check the payment status with the transaction_id
        }
        if UserDefaults.standard.value(forKey: "USER-CANCELLED-ON-VERIFY") != nil {
            //Transaction cancelled by user when trying to verify UPI payment
            
        }
    }

    func onFinish(order: Order, error: String) {
        if !error.isEmpty {
            DispatchQueue.main.async {
                //hide spinner
                // show the error message
                
                print(error)
            }
        } else {
            DispatchQueue.main.async {
                //hide spinner
                Instamojo.invokePaymentOptionsView(order: order)
                
                print(order)
                
                
            }
        }
    }
}



    

    
    
