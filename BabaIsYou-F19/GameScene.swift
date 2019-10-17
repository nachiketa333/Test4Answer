//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var player:SKSpriteNode!
    
    var mouseX:CGFloat = 0
    var mouseY:CGFloat = 0
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let locationTouched = touches.first
        if (locationTouched == nil) {
            // an error occured
            return
            
                let mousePosition = locationTouched!.location(in:self)
                
                print("mouseX = \(mousePosition.x)")
                print("mouseY = \(mousePosition.y)")
                print("-------")
            
            self.mouseX = mousePosition.x
            self.mouseY = mousePosition.y
    }
        
    }
    
    func movePlayer(mouseXPosition:CGFloat, mouseYPostion:CGFloat) {
        
        // move the player towards the mouse
        
        
        // 1. calculate disatnce between mouse and player
        let a = (self.mouseX - self.player.position.x);
        let b = (self.mouseY - self.player.position.y);
        let distance = sqrt((a * a) + (b * b))
        
        // 2. calculate the "rate" to move
        let xn = (a / distance)
        let yn = (b / distance)
        
        // 3. move the bullet
        self.player.position.x = self.player.position.x + (xn * 10);
        self.player.position.y = self.player.position.y + (yn * 10);
        
        self.movePlayer(mouseXPosition: self.mouseX, mouseYPostion: self.mouseY)
        
    }
    
    
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
    }
    
    
}
