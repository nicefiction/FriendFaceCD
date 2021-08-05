//
//  FriendFaceCDApp.swift
//  FriendFaceCD
//
//  Created by Olivier Van hamme on 05/08/2021.
//

import SwiftUI

@main
struct FriendFaceCDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
