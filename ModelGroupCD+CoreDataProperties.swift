//
//  ModelGroupCD+CoreDataProperties.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//
//

import Foundation
import CoreData


extension ModelGroupCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ModelGroupCD> {
        return NSFetchRequest<ModelGroupCD>(entityName: "ModelGroupCD")
    }

    @NSManaged public var name: String?
    @NSManaged public var photo: String?
    @NSManaged public var descript: String?
    @NSManaged public var id: Int64

}

extension ModelGroupCD : Identifiable {

}
