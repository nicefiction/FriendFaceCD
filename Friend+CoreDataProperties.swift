// Friend+CoreDataProperties.swift

// MARK: - LIBRARIES -

import Foundation
import CoreData


extension Friend {
   
   @nonobjc
   public class func fetchRequest()
   -> NSFetchRequest<Friend> {
      
      return NSFetchRequest<Friend>(entityName: "Friend")
   }
   
   
   @NSManaged public var id: String?
   @NSManaged public var name: String?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   public var wrappedID: String { return id ?? "N/A" }
   public var wrappedName: String { return name ?? "N/A" }
}





// MARK: - EXTENSIONS -

extension Friend : Identifiable {}
