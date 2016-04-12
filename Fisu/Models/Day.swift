//
//  Day.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import Foundation
import CoreData


class Day: NSManagedObject {
    
    static var entityName: String = "Day"
    
    class func findOneByNumber(moc: NSManagedObjectContext, number: Int) -> Day? {
        let req = NSFetchRequest(entityName: "Day")
        req.predicate = NSPredicate(format: "number == %d", number)
        do {
            let result = try moc.executeFetchRequest(req) as! [Day]
            if(result.count == 1) {
                return result[0]
            }
            return nil
        }
        catch {
            fatalError()
        }
    }
    
    class func findAll(moc: NSManagedObjectContext) -> [Day] {
        let req = NSFetchRequest(entityName: Day.entityName)
        req.sortDescriptors = [NSSortDescriptor(key: "number", ascending: true)]
        do {
            let result = try moc.executeFetchRequest(req) as! [Day]
            return result
        }
        catch {
            fatalError()
        }
    }
    
    class func insertToContext(moc: NSManagedObjectContext, number: Int, date: NSDate) -> Day {
        let newDay = NSEntityDescription.insertNewObjectForEntityForName(Day.entityName, inManagedObjectContext: moc) as! Day
        newDay.date = date
        newDay.number = number
        return newDay
    }
    
    class func initData(moc: NSManagedObjectContext) -> [Day] {
        let dates = [NSDate(), NSDate(), NSDate(), NSDate(), NSDate(), NSDate(), NSDate()]
        var results : [Day] = []
        var i = 1
        for d in dates {
            do {
                let _day = Day.findOneByNumber(moc, number: i)
                if(_day == nil) {
                    results.append(Day.insertToContext(moc, number: i, date: d))
                }
                else {
                    results.append(_day!)
                }
                i += 1
            }
        }
        return results
    }

}
