//
//  NewArrivalViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 16/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation



class NewArrivalViewController: UIViewController, AVAudioPlayerDelegate {
    
    
    //Variables

    var songs = ["Ding", "Don't Leave", "Scared To Be Lonely", "Feel Good", "One More Weekend", "The One"]
    var soundPlayer: AVAudioPlayer?
    var index = 0
    var elapsedTime: TimeInterval = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playMusic()
    }
    
    //
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        player.delegate = nil
    
        if flag {
            index += 1
            print("\(index)")
        }
        if (index == songs.count) {
            index = 0
            print("\(index)")
        }
        playMusic()
    }
    
   //Prepare to play songs
    func playMusic(){
        let path = Bundle.main.path(forResource: songs[index], ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do
        {
            try soundPlayer = AVAudioPlayer(contentsOf: url)
            soundPlayer?.delegate = self
            soundPlayer?.prepareToPlay()
        }
        catch {print("file not available")}
        if soundPlayer != nil{
            soundPlayer!.play()
    
        }
    }
    
    
    @IBOutlet weak var switchCondition: UISwitch!

    @IBAction func showPopup(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpIDa") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showPopup2(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpIDb") as! PopUp2ViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showPopup3(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpIDc") as! PopUp3ViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }

    
    // Controls the music play
    //- Parameter sender:
    
    @IBAction func musicswitch(_ sender: UISwitch) {
        if soundPlayer != nil{
            if sender.isOn == true
            {
                soundPlayer!.currentTime = elapsedTime
                soundPlayer!.play()
            }
            
        else{
                soundPlayer!.pause()
                elapsedTime = soundPlayer!.currentTime
            }
        }
      
    }
    
    @IBAction func musicstop(_ sender: UIButton) {
            soundPlayer!.stop()
            elapsedTime = 0
        }



    @IBAction func backHomeClickAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
 
}
    



