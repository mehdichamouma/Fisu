//
//  Activity+CoreDataProperties.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Activity {

    @NSManaged var name: String?
    @NSManaged var selected: NSNumber?
    @NSManaged var descr: String?
    @NSManaged var day: Day?
    @NSManaged var beginAtHour: NSNumber?
    @NSManaged var beginAtMinute: NSNumber?
    @NSManaged var endAtHour: NSNumber?
    @NSManaged var endAtMinute: NSNumber?
    @NSManaged var speaker: Speaker?
    @NSManaged var place: Place?

}
