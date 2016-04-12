//
//  Place.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import Foundation
import CoreData


class Place: NSManagedObject {
    static var entityName = "Place"
    
    class func insertToContext(moc: NSManagedObjectContext, name: String, latitude: Double, longitude: Double) -> Place {
        let newPlace = NSEntityDescription.insertNewObjectForEntityForName(Place.entityName, inManagedObjectContext: moc) as! Place
        newPlace.latitude = latitude
        newPlace.longitude = longitude
        newPlace.name = name
        return newPlace
    }
    
    class func findOneByName(moc: NSManagedObjectContext, name: String) -> Place? {
        let req = NSFetchRequest(entityName: "Place")
        req.predicate = NSPredicate(format: "name == %@", name)
        return self._findOne(moc, request: req)
    }
    
    class func findAll(moc: NSManagedObjectContext) -> [Place?] {
        let req = NSFetchRequest(entityName: Place.entityName)
        return self._findAll(moc, request: req)
    }
    
    class func initData(moc: NSManagedObjectContext) -> [Place] {
        let places = [
                ["place1", 80.00, 80.00],
                ["place2", 80.00, 80.00],
                ["place3", 80.00, 80.00],
                ["place4", 80.00, 80.00],
                ["place5", 80.00, 80.00],
                ["place6", 80.00, 80.00],
                ["place7", 80.00, 80.00]
        ]
        var results : [Place] = []
        
        for p in places {
            do {
                let _place = Place.findOneByName(moc, name: p[0] as! String)
                if(_place == nil) {
                    results.append(Place.insertToContext(moc, name: p[0] as! String, latitude: p[1] as! Double, longitude: p[2] as! Double))
                }
                else {
                    results.append(_place!)
                }
            }
        }
        return results
    }
}
