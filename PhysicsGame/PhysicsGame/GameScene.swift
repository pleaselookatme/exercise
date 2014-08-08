//
//  GameScene.swift
//  PhysicsGame
//
//  Created by mohoo on 14-8-8.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var location = touches.anyObject().locationInNode(self)
        var l = SKLabelNode()
        l.text = "小刚"
        addChild(l)
        l.position = location
        l.physicsBody = SKPhysicsBody(rectangleOfSize: l.frame.size)
        /* Called when a touch begins */
        
        /*for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }*/
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
