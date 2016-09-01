//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by AW on 26/08/2016.
//  Copyright © 2016 AW. All rights reserved.
//

import Foundation
import CoreData

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var toImage: Image?
    @NSManaged public var toType: Type?
    @NSManaged public var toStore: Store?

}
