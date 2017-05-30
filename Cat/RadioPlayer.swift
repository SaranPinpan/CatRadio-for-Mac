//
//  RadioPlayer.swift
//  Cat
//
//  Created by Saran Pinpan on 5/30/17.
//  Copyright © 2017 com.saran. All rights reserved.
//

import Foundation
import AVFoundation

class RadioPlayer {
    static let sharedInstance = RadioPlayer()
    private var player = AVPlayer(url: NSURL(string: "http://203.145.115.35/CatRadio/CatRadio-High/chunklist_w86482277.m3u8")! as URL)
    private var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = true
        player.volume = 1.0
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
}
