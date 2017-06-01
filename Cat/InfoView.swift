//
//  InfoView.swift
//  Cat
//
//  Created by Saran Pinpan on 6/1/17.
//  Copyright © 2017 com.saran. All rights reserved.
//

import Cocoa

class InfoView: NSView {

    @IBOutlet var songName: NSTextField!
    @IBOutlet var artistName: NSTextField!
    @IBOutlet var songImage: NSImageView!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func updateInfo(song:String, artist:String, image:String) {
        if !(song.isEmpty && artist.isEmpty && image.isEmpty) {
            DispatchQueue.main.async {
                self.songName.stringValue = song
                self.artistName.stringValue = artist
                
                let url = URL(string: image)
                let data = try? Data(contentsOf: url!)
                self.songImage.image = NSImage(data: data!)
            }
        } else{
            DispatchQueue.main.async {
                self.songName.stringValue = "-"
                self.artistName.stringValue = "-"
                self.songImage.image = NSImage(named: "CoverImage")
            }
        }
        
    }
    
}
