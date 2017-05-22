//
//  MusicViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 15/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MusicViewController : UIViewController,
    UIPickerViewDelegate,
    UIPickerViewDataSource
{
    
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0
    var gameTimer : Timer?
    var gravity : UIGravityBehavior?
    var animator : UIDynamicAnimator?
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        // set timer to show balloons
      
        

         //songs type
        songs.dataSource = self
        songs.delegate = self
        
        
        let path = Bundle.main.path(forResource: "One More Weekend", ofType: "mp3")
        

        
        // URL of the file
        let url = URL(fileURLWithPath: path!)
        
        do {
            
            //Set up the player by loading the sound file
            try soundPlayer = AVAudioPlayer(contentsOf: url)
        }
            //Catch the Error if playback fails
        catch {print ("file not available")}
        
        
                // set timer to show balloons
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(MusicViewController.addSnow(_ :)), userInfo: nil, repeats: true)
        
        // register an animator
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items:[])
        
        let vector = CGVector(dx: 0.0, dy: 0.1) //gravity magnitude and direction
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
        

        
    
        
    }


    
    func addSnow ( _ : Any) {
        
        //pick a random x position for the balloon
        let xCoordinate = arc4random() % UInt32 (self.view.bounds.width)
        
        //create a button, set Image, assign touchUpInside handler, add it to the view and gravity animator
        
        let btn = UIButton(frame: CGRect (x: Int(xCoordinate), y:60, width: 30, height : 30))
        btn.setImage(UIImage(named: "snow"), for: .normal)
        btn.addTarget(self, action: #selector(self.didPopSnow(sender:)), for: .touchUpInside )
        self.view.addSubview(btn)
        
        gravity?.addItem( btn as UIView)
        
}
    
    func didPopSnow (sender : UIButton) {
        
        sender.setImage(UIImage (named : "snow2"), for: .normal)
        UIView.animate(withDuration: 0.4, animations:{sender.alpha = 0},
                       completion: {(true) in sender.removeFromSuperview()})
        
    }
    
    
     //Button link
    

    
    @IBOutlet weak var songs: UIPickerView!
    
    @IBOutlet weak var images: UIImageView!
    

    
    var items = ["One More Weekend", "Drenched", "Scared To Be Lonely", "Feel Good", "Don't Leave", "The One"]
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let path = Bundle.main.path(forResource: items[row], ofType:"mp3")
        
        let url = URL(fileURLWithPath: path!)
        do  {
            try soundPlayer = AVAudioPlayer(contentsOf: url)
        }
        catch {print("file not avaliable")}
        images.image = UIImage(named: (items[row]+".jpg"))
        
        }

    @IBOutlet weak var lyris: UITextView!
    @IBOutlet weak var lyris2: UITextView!
    @IBOutlet weak var lyris3: UITextView!
    @IBOutlet weak var lyris4: UITextView!
    @IBOutlet weak var lyris5: UITextView!
    @IBOutlet weak var lyris6: UITextView!
    
    @IBAction func lyrisChanged(_ sender: UIPageControl) {
        switch (sender.currentPage)
        {
        case 0:
            lyris.isHidden = false
            lyris2.isHidden = true
            lyris3.isHidden = true
            lyris4.isHidden = true
            lyris5.isHidden = true
            lyris6.isHidden = true
            break
        case 1:
            lyris.isHidden = true
            lyris2.isHidden = false
            lyris3.isHidden = true
            lyris4.isHidden = true
            lyris5.isHidden = true
            lyris6.isHidden = true
            break
        case 2:
            lyris.isHidden = true
            lyris2.isHidden = true
            lyris3.isHidden = false
            lyris4.isHidden = true
            lyris5.isHidden = true
            lyris6.isHidden = true
            break
        case 3:
            lyris.isHidden = true
            lyris2.isHidden = true
            lyris3.isHidden = true
            lyris4.isHidden = false
            lyris5.isHidden = true
            lyris6.isHidden = true
            break
        case 4:
            lyris.isHidden = true
            lyris2.isHidden = true
            lyris3.isHidden = true
            lyris4.isHidden = true
            lyris5.isHidden = false
            lyris6.isHidden = true
        case 5:
            lyris.isHidden = true
            lyris2.isHidden = true
            lyris3.isHidden = true
            lyris4.isHidden = true
            lyris5.isHidden = true
            lyris6.isHidden = false
            break
        default:
            lyris.isHidden = false
            lyris2.isHidden = true
            lyris3.isHidden = true
            lyris4.isHidden = true
            lyris5.isHidden = true
            lyris6.isHidden = true
            break
          
        }
    }
    
    @IBAction func play(_ sender: UIButton) {
        
        //Play & Resume
        
        if soundPlayer != nil{
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }

    }
 
    @IBAction func pause(_ sender: UIButton) {
        
        //Pause
        
        if soundPlayer != nil{
            elapsedTime = soundPlayer!.currentTime
            soundPlayer!.pause()
            print ("\(elapsedTime)")
        }
    }
    

    @IBAction func stop(_ sender: UIButton) {
        
        //Stop
        
        if soundPlayer != nil {
            soundPlayer!.stop()
            elapsedTime = 0
        }

    }
    

    @IBAction func slider(_ sender: UISlider) {
        
        soundPlayer?.volume = sender.value
    }
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backNAClickAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


    
}

    



