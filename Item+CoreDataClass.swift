//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by AW on 26/08/2016.
//  Copyright © 2016 AW. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
