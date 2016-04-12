//
//  Speaker.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import Foundation
import CoreData


class Speaker: NSManagedObject {
    
    static var entityName : String = "Speaker"
    
// Insert code here to add functionality to your managed object subclass
    class func findOneByName(moc: NSManagedObjectContext, name: String) -> Speaker? {
        let req = NSFetchRequest(entityName: Speaker.entityName)
        req.predicate = NSPredicate(format: "name == %@", name)
        return self._findOne(moc, request: req)
    }
    
    class func insertToContext(moc: NSManagedObjectContext, name: String, bio: String, profession: String) -> Speaker {
        let newSpeaker = NSEntityDescription.insertNewObjectForEntityForName(Speaker.entityName, inManagedObjectContext: moc) as! Speaker
        newSpeaker.bio = bio
        newSpeaker.name = name
        newSpeaker.profession = profession
        
        return newSpeaker
    }
    
    class func findAll(moc: NSManagedObjectContext) -> [Speaker?] {
        let req = NSFetchRequest(entityName: Speaker.entityName)
        return self._findAll(moc, request: req)
    }
    
    class func initData(moc: NSManagedObjectContext) -> [Speaker] {
        let speakers: [(String, String, String)] = [
            ("speaker1", "bio", "profession"),
            ("speaker2", "bio", "profession"),
            ("speaker3", "bio", "profession"),
            ("speaker4", "bio", "profession"),
            ("speaker5", "bio", "profession"),
        ]
        
        var results : [Speaker] = []
        
        for s in speakers {
            let _speaker = Speaker.findOneByName(moc, name: s.0)
            if(_speaker == nil) {
                results.append(Speaker.insertToContext(moc, name: s.0, bio: s.1, profession: s.2))
            }
            else {
                results.append(_speaker!)
            }
        }
        return results
    }
}
