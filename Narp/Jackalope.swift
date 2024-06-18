//
//  Jackalope.swift
//  Narp
//
//  Created by Patrick Wheeler on 6/17/24.
//

import Foundation

class Jackalope : Hero {
    
    override init(named name: String) {
        super.init(named: name)
        self.yoString = "Spoon!"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    override var yoString: String {
//        return "Yep"
//    }
    
    /* 
     I considered creating a custom init() here that would assign the self.heroName without needing to pass in a name String "Narp" in the init(named:)
     
     override init() {
        super.init()
        self.heroName = "Narp"
        self.yoString = "Let's Go"
     }
     
     but might also neccesitate
        required init?(coder aDecoder: NSCoder) {...
     ...and that felt like a lot of code to add to every subclass

    */
}
