// User+CoreDataProperties.swift

// MARK: - LIBRARIES -

import Foundation
import CoreData


extension User {
   
   @nonobjc
   public class func fetchRequest()
   -> NSFetchRequest<User> {
      
      return NSFetchRequest<User>(entityName: "User")
   }
   
   
   @NSManaged public var id: String?
   @NSManaged public var isActive: Bool
   @NSManaged public var name: String?
   @NSManaged public var age: Int16
   @NSManaged public var company: String?
   @NSManaged public var email: String?
   @NSManaged public var address: String?
   @NSManaged public var about: String?
   @NSManaged public var registered: String?
   @NSManaged public var tags: String?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   public var wrappedID: String { return id ?? "N/A" }
   public var wrappedName: String { return name ?? "N/A" }
   public var wrappedCompany: String { return company ?? "N/A" }
   public var wrappedEmail: String { return email ?? "N/A" }
   public var wrappedAddress: String { return address ?? "N/A" }
   public var wrappedAbout: String { return about ?? "N/A" }
   public var wrappedRegistered: String { return registered ?? "N/A" }
   public var wrappedTags: String { return tags ?? "N/A" }
}





// MARK: - EXTENSIONS -

extension User : Identifiable {}
