//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var bombSoundEffect: AVAudioPlayer?
    var noteHasChanged : String = ""
    var soundArray =  [ "note1.wav" , "note2.wav" , "note3.wav" , "note4.wav" , "note5.wav" , "note6.wav" , "note7.wav" ]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        noteHasChanged = soundArray[sender.tag-1]
        print(sender.tag)
        print(noteHasChanged)
        
        changeSound()

        
    }
    
    func changeSound()
    {
    let path = Bundle.main.path(forResource: noteHasChanged , ofType:nil)!
    let url = URL(fileURLWithPath: path)
    
    do {
    bombSoundEffect = try AVAudioPlayer(contentsOf: url)
    bombSoundEffect?.play()
    } catch {
    // couldn't load file :(
    }
    }
    


}

