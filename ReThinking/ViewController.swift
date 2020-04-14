//
//  ViewController.swift
//  ReThinking
//
//  Created by Pires Cerullo on 04/03/20.
//  Copyright © 2020 Pires Cerullo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //IBOutlet
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var Sound: UIButton!
    
    enum Cloud{
        case no1
        case no2
        case no3
        case no4
        case no5
    }

    var QuesNum: Cloud = Cloud.no1
    //counter for music
    var bgmCounter = 0
    //user default music
    let music = UserDefaults.standard
    //music player
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //icon aspect ratio
        Sound.imageView?.contentMode = .scaleAspectFit
        //define sound as soundApp.wav
        let sound = Bundle.main.path(forResource: "soundApp", ofType: "wav")
        //prepare if the sound doesnt load
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print("error")
        }
        bgmCounter=music.integer(forKey: "bgmstate")
        if(bgmCounter==1){
            //change image after click mute button
            Sound.setImage(#imageLiteral(resourceName: "openSound"), for: .normal)
            Sound.imageView?.contentMode = .scaleToFill
            if audioPlayer.isPlaying == true {
                audioPlayer.pause()
            }
        else {
                audioPlayer.play()
            }
        }
        else if (bgmCounter==2){
            bgmCounter=0
            Sound.setImage(#imageLiteral(resourceName: "closeSound"), for: .normal)
            Sound.imageView?.contentMode = .scaleAspectFit
            if audioPlayer.isPlaying == false{
                audioPlayer.play()
            }
            else{
                audioPlayer.pause()
            }
        }
        //audio loop forever
        audioPlayer.numberOfLoops = -1
    }

    //action press button question 1-5 and send the choosen question to SubViewController
    @IBAction func Q(_ sender: UIButton) {
        switch sender {
        case B1:
            QuesNum = .no1
        case B2:
            QuesNum = .no2
        case B3:
            QuesNum = .no3
        case B4:
            QuesNum = .no4
        case B5:
            QuesNum = .no5
        default:
            print("doesnt do anything")
        }
        performSegue(withIdentifier: "goToQ", sender: nil)
    }
    //action for mute sound
    @IBAction func MuteBtn(_ sender: UIButton) {
           bgmCounter += 1
        if(bgmCounter==1){
            //change image after click mute button
            Sound.setImage(#imageLiteral(resourceName: "openSound"), for: .normal)
            Sound.imageView?.contentMode = .scaleToFill
            if audioPlayer.isPlaying == true {
                audioPlayer.pause()
            }
        else {
                audioPlayer.play()
            }
        }
        else if (bgmCounter==2){
            bgmCounter=0
            Sound.setImage(#imageLiteral(resourceName: "closeSound"), for: .normal)
            Sound.imageView?.contentMode = .scaleAspectFit  
            if audioPlayer.isPlaying == false{
                audioPlayer.play()
            }
            else{
                audioPlayer.pause()
            }
        }
        music.set(bgmCounter,forKey: "bgmstate")
    }
    //passing data using segue for SubViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.destination is SubViewController
            {
                switch QuesNum{
                case .no1:
                let vc = segue.destination as? SubViewController
                vc?.QNS = 1
                    
                case .no2:
                let vc = segue.destination as? SubViewController
                vc?.QNS = 2
                    
                case .no3:
                let vc = segue.destination as? SubViewController
                vc?.QNS = 3
                    
                case .no4:
                let vc = segue.destination as? SubViewController
                vc?.QNS = 4
                    
                case .no5:
                let vc = segue.destination as? SubViewController
                vc?.QNS = 5
                
                }
            }
        }
    }
