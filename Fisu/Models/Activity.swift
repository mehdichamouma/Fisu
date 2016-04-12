//
//  Activity.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import Foundation
import CoreData


class Activity: NSManagedObject {

    static var entityName : String = "Activity"
    
    var beginAt: String {
        get {
            return Activity.hourFormatter(beginAtHour!, minute: beginAtMinute!)
        }
    }
    var endAt: String {
        get {
            return Activity.hourFormatter(endAtHour!, minute: endAtMinute!)
        }
    }
    
    var isSelected: Bool {
        get {
            return (selected == 1)
        }
        set {
            selected = newValue ? 1 : 0
        }
    }
    
    class func hourFormatter(hour: NSNumber, minute: NSNumber) -> String {
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 2
        return formatter.stringFromNumber(hour)! + "h" + formatter.stringFromNumber(minute)!
    }
    // Insert code here to add functionality to your managed object subclass
    class func findOneByDayAndName(moc: NSManagedObjectContext, day: Day, name: String) -> Activity? {
        let req = NSFetchRequest(entityName: "Activity")
        print(day.number!)
        print(name)
        req.predicate = NSPredicate(format: "name == %@",  name)
        return self._findOne(moc, request: req)
    }
    
    class func insertToContext(moc: NSManagedObjectContext, name: String, descr: String, speaker: Speaker, place: Place, day: Day,beginAtHour: Int, beginAtMinute: Int, endAtHour: Int, endAtMinute: Int) -> Activity {
        
        let newActivity = NSEntityDescription.insertNewObjectForEntityForName(self.entityName, inManagedObjectContext: moc) as! Activity
        
        newActivity.beginAtHour = beginAtHour
        newActivity.day = day
        newActivity.speaker = speaker
        newActivity.place = place
        newActivity.name = name
        newActivity.descr = descr
        newActivity.beginAtMinute = beginAtMinute
        newActivity.endAtMinute = endAtMinute
        newActivity.endAtHour = endAtHour
        
        return newActivity
    }
    
    class func findAll(moc: NSManagedObjectContext) -> [Activity?] {
        let req = NSFetchRequest(entityName: self.entityName)
        return self._findAll(moc, request: req)
    }
    
    class func findAllByDay(moc: NSManagedObjectContext, day: Day) -> [Activity?] {
        let req = NSFetchRequest(entityName: self.entityName)
        req.predicate = NSPredicate(format: "day.number == %d", (day.number?.intValue)!)
        req.sortDescriptors = [
                NSSortDescriptor(key: "beginAtHour", ascending: true),
                NSSortDescriptor(key: "beginAtMinute", ascending: true)
        ]
        return self._findAll(moc, request: req)
    }
    
    class func initData(moc: NSManagedObjectContext, days: [Day], speakers: [Speaker], places: [Place]) -> [Activity] {
        //[(name, descr, speaker, place, day, bh, bm, eh, em)]
        let activities: [(String, String, Speaker, Place, Day, Int, Int, Int, Int)] = [
            ("activity1", "description", speakers[0], places[0], days[0], 9, 00, 10, 00),
            ("activity2", "description", speakers[0], places[1], days[0], 10, 00, 11, 00),
            ("activity3", "description", speakers[1], places[0], days[1], 11, 20, 13, 00),
            ("activity4", "description", speakers[2], places[1], days[1], 14, 00, 15, 00),
            ("activity5", "description", speakers[0], places[1], days[2], 9, 00, 10, 00),
            ("activity6", "description", speakers[1], places[1], days[2], 10, 00, 12, 00)
        ]
        
        var results : [Activity] = []
        
        for a in activities {
            let _activity = Activity.findOneByDayAndName(moc, day: a.4, name: a.0)
            if(_activity == nil) {
                results.append(Activity.insertToContext(moc, name: a.0, descr: a.1, speaker: a.2, place: a.3, day: a.4, beginAtHour: a.5, beginAtMinute: a.6, endAtHour: a.7, endAtMinute: a.8))
            }
            else {
                results.append(_activity!)
            }
        }
        return results
    }

}
