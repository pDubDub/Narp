//
//  ContentView.swift
//  Narp
//
//  Created by Patrick Wheeler on 6/17/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 1024, height: 768)
        scene.scaleMode = .aspectFill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}


#Preview {
    ContentView()
}
