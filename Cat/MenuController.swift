//
//  MenuController.swift
//  Cat
//
//  Created by Saran Pinpan on 5/30/17.
//  Copyright © 2017 com.saran. All rights reserved.
//

import Cocoa
import MediaPlayer
import AVFoundation

class MenuController: NSObject {
    
    @IBOutlet weak var menu: NSMenu!
    
    @IBOutlet weak var playButton: NSMenuItem!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        statusItem.image = icon
        statusItem.menu = menu
        
    }
    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func playClicked(_ sender: NSMenuItem) {
        toggle()
    }
    
    func toggle() {
        if RadioPlayer.sharedInstance.currentlyPlaying() {
            pauseRadio()
        } else {
            playRadio()
        }
    }
    
    func playRadio() {
        RadioPlayer.sharedInstance.play()
        playButton.setTitleWithMnemonic("Pause radio")
    }
    
    func pauseRadio() {
        RadioPlayer.sharedInstance.pause()
        playButton.setTitleWithMnemonic("Play radio")
    }
}
