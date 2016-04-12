//
//  Core.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class App {
    class func initialize() -> Void {
        let moc = App.getMoc()
        
        let days = Day.initData(moc)
        let places = Place.initData(moc)
        let speakers = Speaker.initData(moc)
        Activity.initData(moc, days: days, speakers: speakers, places: places)
        
        do {
            try moc.save()
        }
        catch {
            fatalError()
        }
    }
    
    class func test() -> Void {
        print("test")
        let moc = App.getMoc()
        
        let days = Day.findAll(moc)
        for d in days {
            print(d.number)
            print(d.date)
        }
        
        let places = Place.findAll(moc)
        for d in places {
            print(d!.name)
            print(d!.latitude)
            print(d!.longitude)
        }
        
        let activities = Activity.findAll(moc)
        for a in activities {
            print(a?.day?.number)
            print(a?.place?.latitude)
            print(a?.place?.longitude)
            print(a?.place?.name)
            print(a?.name)
            print(a?.speaker?.bio)
            print(a?.speaker?.name)
            print(a?.speaker?.profession)
        }
        
    }
    
    class func getMoc() -> NSManagedObjectContext {
        let appDeg = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDeg.managedObjectContext
    }
}