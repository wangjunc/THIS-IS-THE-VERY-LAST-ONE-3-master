//
//  UserAcc2ViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 21/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit

class UserAcc2ViewController: UIViewController {
    
    @IBOutlet weak var accountlbl: UILabel!

    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func viewDidAppear(_ animated: Bool)
    {  accountlbl.text = account
      }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backUserAccClickAction(_ sender: UIButton) {
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
