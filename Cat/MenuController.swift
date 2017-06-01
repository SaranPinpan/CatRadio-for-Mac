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
import Alamofire

class MenuController: NSObject {
    
    @IBOutlet weak var menu: NSMenu!
    
    @IBOutlet weak var playButton: NSMenuItem!
    @IBOutlet weak var infoView: InfoView!
    var infoMenuItem: NSMenuItem!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        statusItem.image = icon
        statusItem.menu = menu
        
        infoMenuItem = menu.item(withTitle: "Info")
        infoMenuItem.view = infoView
        
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
        
        radioInfo()
        
        Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(radioInfo), userInfo: nil, repeats: true)
    }
    
    func pauseRadio() {
        RadioPlayer.sharedInstance.pause()
        playButton.setTitleWithMnemonic("Play radio")
    }
    
    func radioInfo(){
        Alamofire.request("http://thisiscat.com/now.php").responseJSON { response in
            print(response.result)
            if let JSON = response.result.value {
                
                let data = JSON as! NSDictionary
                let nowPlaying = data.value(forKey: "now") as! NSDictionary
                let image = nowPlaying.value(forKey: "id") as! String
                
                self.infoView.updateInfo(song: nowPlaying.value(forKey: "song")! as! String, artist: nowPlaying.value(forKey: "name")! as! String, image: "http://cms.thisiscat.tk/admin/pix/single/\(image)_medium.jpg")
            }
            
        }
        
    }
}
