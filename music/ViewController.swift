//
//  ViewController.swift
//  music
//
//  Created by Tryston Hoyes on 2019-02-19.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate  {

    var myMediaPlayer = MPMusicPlayerController.systemMusicPlayer
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Include code here for something that needs to be done as soon as the view loads
        
//        this makes it play as soon as the view loads & stops playing when it closes
//        let myMediaPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer
//        myMediaPlayer.setQueue(with: MPMediaQuery.songs())
//        myMediaPlayer.play()


    }
//     Retrieved from https://developer.apple.com/documentation/mediaplayer/displaying_a_media_picker_from_your_app allows for user to select music from their local library
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        myMediaPlayer.setQueue(with: mediaItemCollection)
        mediaPicker.dismiss(animated: true, completion: nil)
        myMediaPlayer.play()
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        mediaPicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func chooseSongsButtonPressed(_ sender: UIButton) {
        let myMediaPickerVC = MPMediaPickerController(mediaTypes: MPMediaType.music)
        myMediaPickerVC.allowsPickingMultipleItems = true
        myMediaPickerVC.popoverPresentationController?.sourceView = sender
        myMediaPickerVC.delegate = self
        self.present(myMediaPickerVC,animated: true, completion: nil)
    }
    
}

