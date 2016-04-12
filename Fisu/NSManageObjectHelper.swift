//
//  NSManageObjectHelper.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    class func _findOne<T>(moc: NSManagedObjectContext,request: NSFetchRequest) -> T? {
        do {
            let result = try moc.executeFetchRequest(request)
            if(result.count >= 1) {
                return result[0] as? T
            }
            return nil
        }
        catch {
            fatalError()
        }
    }
    
    class func _findAll<T>(moc: NSManagedObjectContext, request: NSFetchRequest) -> [T?] {
        do {
            let result = try moc.executeFetchRequest(request)
            var set : [T?] = []
            for r in result {
                let s = r as? T
                set.append(s)
            }
            return set
        }
        catch {
            fatalError()
        }
    }
    
}