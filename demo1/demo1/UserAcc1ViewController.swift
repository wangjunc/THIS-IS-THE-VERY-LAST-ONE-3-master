//
//  UserAcc1ViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 21/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit

var account = ""
var password = ""

class UserAcc1ViewController: UIViewController {

    @IBOutlet weak var outlet: UITextField!
    
    @IBOutlet weak var outlet2: UITextField!
    
    @IBAction func action(_ sender: AnyObject)
    {
       if (outlet.text != "" && outlet2.text != "")
       {
        account = outlet.text!
        password = outlet2.text!
        
        
        let alertController = UIAlertController(title: "Logged in successfully!", message: "You are now logged in",
                                                preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Ok", style: .default) {(action) -> Void in
            self.performSegue(withIdentifier: "segue1", sender: self)
        }
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)

       }

    
        
        
       if (outlet.text == "")
       {
        
        let alertController = UIAlertController(title: "Account number", message: "This cannot be empty",
                                                preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Ok", style: .default) {(action) -> Void in print ("ACCOUNT NUMBER CANNOT BE EMPTY")}
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        }
       else if (outlet2.text == "")
       {
        
        let alertController = UIAlertController(title: "Password", message: "This cannot be empty",
                                                preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Ok", style: .default) {(action) -> Void in print ("PASSWORD CANNOT BE EMPTY")}
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
