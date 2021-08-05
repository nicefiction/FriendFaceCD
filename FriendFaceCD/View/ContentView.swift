// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: User.entity(),
                 sortDescriptors: []) var users: FetchedResults<User>
   @ObservedObject var friendFaces: FriendFaces = FriendFaces()
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(friendFaces.users, id: \.id) { (user: User) in
               Text(user.wrappedName)
            }
         }
         .navigationBarTitle(Text("FriendFace"))
         .onAppear(perform: loadData)
      }
   }
   
   
   
   // MARK: - METHODS
   
   func loadData() {
      
      /// `2` Creates  the URL we want to read .
      let friendFaceURL: String = "https://www.hackingwithswift.com/samples/friendface.json"
      
      guard let _url = URL(string: friendFaceURL)
      else {
         print("Invalid URL")
         return
      }
      
      /// `3` Wraps the URL in a `URLRequest`,
      /// which allows us to configure how the URL should be accessed .
      let urlRequest = URLRequest(url: _url)
      
      /// `4` Creates and starts a networking task from that URL request .
      /// Handles the result of that networking task .
      /// `URLSession` is the iOS class responsible for managing network requests .
      /// It is very common to use the `shared` session that iOS creates for us to use .
      /// but you can create your own .
      URLSession.shared.dataTask(with: urlRequest) {(data: Data?,
                                                     urlResponse: URLResponse?,
                                                     error: Error?) in
         
         if let _data = data {
            if let _decodedUsers = try? JSONDecoder().decode([User].self,
                                                             from: _data) {
               /// `4.1` We have good data , go back to the main thread :
               DispatchQueue.main.async {
                  /// `4.2` Update our UI :
                  self.friendFaces.users = _decodedUsers
               }
               /// `4.3` Everything is good , so we can exit :
               return
            }
         }
         /// `4.4` If we are still here , it means there was a problem :
         print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
      }.resume()
      
      URLSession.shared.dataTask(with: urlRequest) {data, response, error in
         
      }.resume()
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
