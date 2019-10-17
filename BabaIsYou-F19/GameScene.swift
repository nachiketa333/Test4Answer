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
    
     let PLAYER_SPEED:CGFloat = 20
    
  //  var mouseX:CGFloat = 0
 //   var mouseY:CGFloat = 0
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
         self.player = self.childNode(withName: "player") as! SKSpriteNode
    }
   
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let mouseTouch = touches.first
               if (mouseTouch == nil) {
                   return
               }
               let location = mouseTouch!.location(in: self)

               // WHAT NODE DID THE PLAYER TOUCH
               // ----------------------------------------------
               let nodeTouched = atPoint(location).name
               //print("Player touched: \(nodeTouched)")
               
               
               // GAME LOGIC: Move player based on touch
               if (nodeTouched == "buttonUp") {
                   // move up
                   self.player.position.y = self.player.position.y + PLAYER_SPEED
               }
               else if (nodeTouched == "buttonDown") {
                   // move down
                    self.player.position.y = self.player.position.y - PLAYER_SPEED
               }
               else if (nodeTouched == "buttonLEFT") {
                   // move left
                    self.player.position.x = self.player.position.x - PLAYER_SPEED
               }
               else if (nodeTouched == "buttonRight") {
                   // move right
                    self.player.position.x = self.player.position.x + PLAYER_SPEED
               }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    
   
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
        if (nodeA!.name == "player" && nodeB!.name == "stopblock") {
            //collision
       
        print("Something collided!")
    }
        
        if (nodeA!.name == "stopblock" && nodeB!.name == "player") {
                   //collision
              
               print("Something collided!")
           }
    
    
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
    }
    
    
}
