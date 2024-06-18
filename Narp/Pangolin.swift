//
//  Pangolin.swift
//  Narp
//
//  Created by Patrick Wheeler on 6/17/24.
//

import Foundation

class Pangolin : Hero {
    
    override init(named name: String) {
        super.init(named: name)
        self.size = CGSize(width: 50, height: 50)
        self.jumpiness = 15
        self.yoString = "Pangolia!"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
