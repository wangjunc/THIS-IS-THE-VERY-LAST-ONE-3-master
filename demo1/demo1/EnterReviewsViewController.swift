//
//  EnterReviewsViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 18/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit

class EnterReviewsViewController: UIViewController {
    
    
    var reviews : Reviews?
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userDate: UITextField!
    @IBOutlet weak var userFeedback: UITextView!
    @IBOutlet weak var userbuttonOnOff: UIButton!
    
    
    @IBAction func userbuttonOnOff(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.setImage(
                UIImage(named: "star"),
                for: .normal
            )
            sender.tag = 1
        }
        else{
            sender.setImage(
                UIImage(named: "star2"), for: .normal
            )
            sender.tag = 0
            }
    }
    

    @IBAction func saveReviewsInfo(_ sender: Any) {
        reviews!.userDate = Utilities.dateFormatter.date(from: userDate.text!)!
        reviews!.userName = userName.text!
        reviews!.userFeedback = userFeedback.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backNAClickAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
