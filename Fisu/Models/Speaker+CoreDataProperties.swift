//
//  Speaker+CoreDataProperties.swift
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

extension Speaker {

    @NSManaged var name: String?
    @NSManaged var bio: String?
    @NSManaged var profession: String?
    @NSManaged var email: String?

}
