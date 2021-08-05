// User+CoreDataClass.swift
// MARK: - SOURCE
// https://www.donnywals.com/using-codable-with-core-data-and-nsmanagedobject/

// MARK: - LIBRARIES -

import Foundation
import CoreData


@objc(User)
public class User: NSManagedObject,
                   Codable {
   
   // MARK: - NESTED TYPES
   
   enum CodingKeys: String,
                    CodingKey {
      case id, isActive, name, age, company, email, address, about, registered // , tags
   }
   
   
   // MARK: - INITIALIZERS
   
   public required convenience init(from decoder: Decoder)
   throws {
      
      guard
         let _context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext
      else {
         throw DecoderConfigurationError.missingManagedObjectContext
      }
      
      self.init(context: _context)
      
      let decodedUserContainer = try decoder.container(keyedBy: CodingKeys.self)
      
      self.about = try decodedUserContainer.decode(String.self, forKey: CodingKeys.about)
      self.address = try decodedUserContainer.decode(String.self, forKey: CodingKeys.address)
      self.age = try decodedUserContainer.decode(Int16.self, forKey: CodingKeys.age)
      self.company = try decodedUserContainer.decode(String.self, forKey: CodingKeys.company)
      self.email = try decodedUserContainer.decode(String.self, forKey: CodingKeys.email)
      self.id = try decodedUserContainer.decode(String.self, forKey: CodingKeys.id)
      self.isActive = try decodedUserContainer.decode(Bool.self, forKey: CodingKeys.isActive)
      self.name = try decodedUserContainer.decode(String.self, forKey: CodingKeys.name)
      self.registered = try decodedUserContainer.decode(String.self, forKey: CodingKeys.registered)
//      self.tags = try decodedUserContainer.decode(String.self, forKey: CodingKeys.tags)
   }
   
   
   
   // MARK: METHODS
   
   public func encode(to encoder: Encoder)
   throws {
      
      var encodedUserContainer = encoder.container(keyedBy: CodingKeys.self)
      
      try encodedUserContainer.encode(about, forKey: CodingKeys.about)
      try encodedUserContainer.encode(address, forKey: CodingKeys.address)
      try encodedUserContainer.encode(age, forKey: CodingKeys.age)
      try encodedUserContainer.encode(company, forKey: CodingKeys.company)
      try encodedUserContainer.encode(email, forKey: CodingKeys.email)
      try encodedUserContainer.encode(id, forKey: CodingKeys.id)
      try encodedUserContainer.encode(isActive, forKey: CodingKeys.isActive)
      try encodedUserContainer.encode(name, forKey: CodingKeys.name)
      try encodedUserContainer.encode(registered, forKey: CodingKeys.registered)
   }
}


   





extension CodingUserInfoKey {
   
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}
