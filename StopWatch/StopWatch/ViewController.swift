//
//  ViewController.swift
//  StopWatch
//
//  Created by Paczeika Dan on 29/08/2018.
//  Copyright © 2018 Paczeika Dan. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    var player: AVAudioPlayer?
    var time = 50
    var timer = Timer()
    var switcher : Bool = true
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImage.loadGif(name: "giphy")
        labelTime.text = " 50" + " Seconds"
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func playTimer(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1 , target: self , selector: #selector(ViewController.action), userInfo: nil , repeats:  true)
   
    }
    @IBAction func pauseTimer(_ sender: UIButton) {
         timer.invalidate()
         slider.isHidden = false
        
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        time = Int(sender.value)
        labelTime.text = " " + String(time) + " Seconds"
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        time = 50
        timer.invalidate()
        labelTime.text  =  " " +  String("50") + " Seconds"
        slider.setValue(50, animated: true )
         slider.isHidden = false
      
    }
    
    @IBAction func musicButton(_ sender: UIButton) {
        if switcher == true
        {
        playSound()
        }
        else
        {
        stopSound()
        }
    }
    
    
    
    @objc func action()
    {
        time = time - 1
        labelTime.text  =  " " + String(time) + " Seconds"
        slider.isHidden = true
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "Ennio", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            switcher = false
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        let url = Bundle.main.url(forResource: "Ennio", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.stop()
            switcher = true
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

