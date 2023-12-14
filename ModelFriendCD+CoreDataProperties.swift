//
//  ModelFriendCD+CoreDataProperties.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//
//

import Foundation
import CoreData


extension ModelFriendCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ModelFriendCD> {
        return NSFetchRequest<ModelFriendCD>(entityName: "ModelFriendCD")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var online: Int64
    @NSManaged public var photo: String?
    @NSManaged public var id: Int64

}

extension ModelFriendCD : Identifiable {

}
