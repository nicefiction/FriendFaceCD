// FriendFaceCDApp.swift

// MARK: - LIBRARIES

import SwiftUI


@main
struct FriendFaceCDApp: App {
   
   // MARK: - PROPERTIES
   
   let persistenceController = PersistenceController.shared
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some Scene {
      
      WindowGroup {
         
         ContentView()
            .environment(\.managedObjectContext,
                         persistenceController.container.viewContext)
      }
   }
}
