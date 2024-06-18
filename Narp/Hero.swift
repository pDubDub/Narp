//
//  Hero.swift
//  Narp
//
//  Created by Patrick Wheeler on 6/17/24.
//

import Foundation
import SpriteKit


class Hero: SKSpriteNode {
    
    var heroName: String = ""
    var yoString: String = "Yo!"
//    {
//        // Will be used as acknowledgment when switching characters. Could even be a randomized array.
//        return "Yo"
//    }
    
    var isInCommand: Bool = false
    
    var speediness: CGFloat = 1
    var interia: CGFloat = 1
    var jumpiness: CGFloat = 30
    var mavity: CGFloat = 1
    // because big heavy pangolins will fall faster than...
    
    init(named name :String) {
        self.heroName = name
        let texture = SKTexture(imageNamed: "heroImage")
        let size = CGSize(width: 40, height: 40)
        
        super.init(texture: texture, color: .clear, size: size)
        
        
        
        
        
        let nameLabel = SKLabelNode()
        nameLabel.text = heroName
        nameLabel.fontColor = .black
        nameLabel.position.y = 30
        nameLabel.fontSize = 20
        addChild(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // this would display a string above there heads, like an exclamation, when you interact with the sprites
    func displayAcknowledgementLabel() {
        let label = SKLabelNode(text: yoString)
        label.position = CGPoint(x: self.position.x, y: self.position.y + 50) // Adjust as needed
        label.fontColor = .white
        label.fontSize = 14
        label.zPosition = 10
        self.addChild(label)
        
        // TODO - make the label only disply for a short time
    }
    
    // called when you switch to this character
    func becomesMainCharacter() {
        isInCommand = true
        displayAcknowledgementLabel()
        
        // Future actions when this hero becomes the main character
        // For example, highlight the character or enable special controls
        
        // for example, the main (or should we change it to "lead"?) should come to forground, both in Z and in size.
    }
    
    // called when someone else becomes the main character
    func becomesSupportCharacter() {
        isInCommand = false
        
        // Remove the label if it exists
        self.childNode(withName: "heroLabel")?.removeFromParent()

    }
    
    func jump() {
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: jumpiness))
        // Adjust the impulse as needed
        print("Jump")
    }
}
