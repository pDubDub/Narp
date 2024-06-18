//
//  GameScene.swift
//  Narp
//
//  Created by Patrick Wheeler on 6/17/24.
//

import Foundation
import SpriteKit


class GameScene: SKScene {
    
    // this array holds all of our heroes, allowing us to interact with them as a group
    var partyOfHeroes: [Hero] = []
    // implemented by GPT. Not really sure how this may be useful to us yet.
    var currentMainCharacter: Hero?
    
    // visual center point of our hero group, useful for moving support characters about the party
    var centerOfParty : CGPoint = CGPoint.zero
    
    override func didMove(to view: SKView) {
        
        // temp solid color until background assets added
        #if os(iOS)
        print("iOS")
        backgroundColor = UIColor(red: 0.82, green: 0.88, blue: 1, alpha: 1)
        #elseif os(macOS)
        backgroundColor = NSColor(red: 0.82, green: 0.88, blue: 1, alpha: 1)
        #endif
        
        // Set up physics world
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        // Adjust gravity as needed
        
        // Add ground placeholder
        addGroundPlaceholder()

        centerOfParty = CGPoint(x: size.width/4, y: size.height/3)
        
        // create our heroes
        let narp = Jackalope(named: "Narp")
        narp.position = centerOfParty
        narp.position.x += 100
        narp.isInCommand = true
        addChild(narp)
        partyOfHeroes.append(narp)
        
        let koda = Pangolin(named: "Koda")
        koda.position = centerOfParty
        koda.position.x += 50
        addChild(koda)
        partyOfHeroes.append(koda)
        
        let dibble = KangarooRat(named: "Dibble")
        dibble.position = centerOfParty
        dibble.position.x -= 20
        addChild(dibble)
        partyOfHeroes.append(dibble)
        
        let quiver = Hedgehog(named: "Quiver")
        quiver.position = centerOfParty
        quiver.position.x -= 80
        addChild(quiver)
        partyOfHeroes.append(quiver)
        
        // Add physics bodies to the heroes
        for hero in partyOfHeroes {
            hero.physicsBody = SKPhysicsBody(rectangleOf: hero.size)
            hero.physicsBody?.affectedByGravity = true
            hero.physicsBody?.allowsRotation = false
        }
        
       
    }
    
    /*
     TODO
     
     next we make lead character move back and forth via arrows
     then make everyone else follow
     
     let's make label text bold if isInCommand
     
     */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            let location = touch.location(in: self)
            
            let screenWidth = size.width
            let screenHeight = size.height

            let leftFifth = screenWidth * 0.2
            let rightFifth = screenWidth * 0.8
            let bottomMiddle = screenHeight * 0.5

            if location.x < leftFifth {
                // Left fifth of the screen
                handleLeftRegionTouch()
            } else if location.x > rightFifth {
                // Right fifth of the screen
                handleRightRegionTouch()
            } else if location.y < bottomMiddle {
                // Bottom middle of the screen
                handleBottomMiddleTouch()
            }
        }
        
        func handleLeftRegionTouch() {
            // Handle left region touch
            print("Left")
            if partyOfHeroes.indices.contains(0) {
                partyOfHeroes[0].jump()
            }
        }
        
        func handleRightRegionTouch() {
            // Handle right region touch
            print("Right")
            if partyOfHeroes.indices.contains(1) {
                partyOfHeroes[1].jump()
            }
        }
        
        func handleBottomMiddleTouch() {
            // Handle bottom middle touch
            print("Bottom")
            if partyOfHeroes.indices.contains(2) {
                partyOfHeroes[2].jump()
            }
        }
    
    func addGroundPlaceholder() {
        let groundHeight: CGFloat = 100
        let groundWidth: CGFloat = size.width
        
        let groundRect = CGRect(x: 0, y: 0, width: groundWidth, height: groundHeight)
        let ground = SKShapeNode(rect: groundRect)
        
        ground.fillColor = UIColor.brown
        ground.strokeColor = UIColor.green
        ground.lineWidth = 5
        
        ground.position = CGPoint(x: 0, y: size.height/7) 
        // Position it at the bottom of the scene
        
        addChild(ground)
        
        // Add physics body to the ground
        ground.physicsBody = SKPhysicsBody(edgeLoopFrom: groundRect)
        ground.physicsBody?.isDynamic = false
    }

    
    
    func switchMainCharacter(to newMainCharacter: Hero) {
        for hero in partyOfHeroes {
            if hero === newMainCharacter {
                hero.becomesMainCharacter()
                currentMainCharacter = hero
            } else {
                hero.becomesSupportCharacter()
            }
        }
    }
    
    /*
     TODO -
     next would be to add the ability to switch between heroes,
     firstly by using the keyboard keys for 1 through 4,
     secondly, by tapping on the sprites
    
     */
}

//extension Hero {
//    func jump() {
//        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 300)) // Adjust the impulse as needed
//    }
//}
