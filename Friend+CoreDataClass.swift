// Friend+CoreDataClass.swift

// MARK: - LIBRARIES -

import Foundation
import CoreData


@objc(Friend)
public class Friend: NSManagedObject,
                     Codable {
   
   // MARK: - NESTED TYPES
   
   enum CodingKeys: String,
                    CodingKey {
      case id, name
   }
   
   
   
   // MARK: - INITIALIZER METHODS
   
   public required convenience init(from decoder: Decoder)
   throws {
      
      guard
         let _context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext
      else {
         throw DecoderConfigurationError.missingManagedObjectContext
      }
      
      self.init(context: _context)
      
      let decodedFriendContainer = try decoder.container(keyedBy: CodingKeys.self)
      
      self.id = try decodedFriendContainer.decode(String.self, forKey: CodingKeys.id)
      self.name = try decodedFriendContainer.decode(String.self, forKey: CodingKeys.name)
   }
   
   
   
   // MARK: METHODS
   
   public func encode(to encoder: Encoder)
   throws {
      
      var encodedFriendContainer = encoder.container(keyedBy: CodingKeys.self)
      
      try encodedFriendContainer.encode(id, forKey: CodingKeys.id)
      try encodedFriendContainer.encode(name, forKey: CodingKeys.name)
   }
}
