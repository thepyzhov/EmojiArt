//
//  EmojiArt_LecturesApp.swift
//  EmojiArt_Lectures
//
//  Created by Dmitry Pyzhov on 31.01.2022.
//

import SwiftUI

@main
struct EmojiArt_LecturesApp: App {
    @StateObject var document = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
                .environmentObject(paletteStore)
        }
    }
}
