//
//  GameViewController.swift
//  BreakoutChallenge
//
//  Created by A.M. Student on 11/7/19.
//  Copyright © 2019 A.M. Student. All rights reserved.
//
import AVFoundation
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "GiornoTheme", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        audioPlayer?.prepareToPlay()
        audioPlayer?.setVolume(0.5, fadeDuration: 0.1)
        audioPlayer?.play()
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
