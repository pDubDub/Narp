//
//  GameScene.swift
//  Narp
//
//  Created by Patrick Wheeler on 6/17/24.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    var partyOfHeroes: [Hero] = []
    var currentMainCharacter: Hero?
    // implemented by GPT. Not sure if this is useful to us yet.
    
    var centerOfParty = CGPoint(x: 0,y: 0)
    
    override func didMove(to view: SKView) {
        // temp solid color until background assets added
        #if os(iOS)
        backgroundColor = UIColor(red: 0.82, green: 0.88, blue: 1, alpha: 1)
        #elseif os(macOS)
        backgroundColor = NSColor(red: 0.82, green: 0.88, blue: 1, alpha: 1)
        #endif
        
        // Add ground placeholder
        addGroundPlaceholder()

        centerOfParty = CGPoint(x: size.width/4, y: size.height/3)
        
        // should they all be part of an array in order to send actions to all of thenm at the same time
        
        // Example hero sprite
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
        dibble.position.x -= 30
        addChild(dibble)
        partyOfHeroes.append(dibble)
        
        let quiver = Hedgehog(named: "Quiver")
        quiver.position = centerOfParty
        quiver.position.x -= 80
        addChild(quiver)
        partyOfHeroes.append(quiver)
        
//        let hero1 = Hero(named: "Narp")
//        hero1.position = centerOfParty
//        hero1.position.x += 60
//        addChild(hero1)
        
//        let hero2 = Hero(named: "Koda")
//        hero2.position = centerOfParty
//        addChild(hero2)
       
      
        /*
         TODO
         
         next we make lead character move back and forth via arrows
         then make everyone else follow
         
         need to add a boolean to hero, to track state of who is leading
         
         let's make label text bold if isInCommand
         
         */
        
        
    }
    
    func addGroundPlaceholder() {
        let groundHeight: CGFloat = 100
        let groundWidth: CGFloat = size.width
        
        let groundRect = CGRect(x: 0, y: 0, width: groundWidth, height: groundHeight)
        let ground = SKShapeNode(rect: groundRect)
        
        ground.fillColor = UIColor.brown
        ground.strokeColor = UIColor.green
        ground.lineWidth = 5
        
        ground.position = CGPoint(x: 0, y: 100) // Position it at the bottom of the scene
        
        addChild(ground)
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
