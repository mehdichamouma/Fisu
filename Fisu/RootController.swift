//
//  RootController.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 12/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import UIKit

class RootController: UITabBarController {
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("test")
        if(segue.identifier == "UserActivities") {
            let controller = segue.destinationViewController as! ProgramTableViewController
            controller.mode = "UserActivities"
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
