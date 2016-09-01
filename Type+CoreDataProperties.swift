//
//  Type+CoreDataProperties.swift
//  DreamLister
//
//  Created by AW on 26/08/2016.
//  Copyright © 2016 AW. All rights reserved.
//

import Foundation
import CoreData

extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "Type");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: NSSet?

}

// MARK: Generated accessors for toItem
extension Type {

    @objc(addToItemObject:)
    @NSManaged public func addToToItem(_ value: Item)

    @objc(removeToItemObject:)
    @NSManaged public func removeFromToItem(_ value: Item)

    @objc(addToItem:)
    @NSManaged public func addToToItem(_ values: NSSet)

    @objc(removeToItem:)
    @NSManaged public func removeFromToItem(_ values: NSSet)

}
