//
//  ProgramTableViewController.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 24/03/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import UIKit
import CoreData

class ProgramTableViewController: UITableViewController {
    
    var activities = [Activity?]()
    var day:Day?
    var mode: String = ""
    var moc: NSManagedObjectContext?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadActivities()
    }
    func loadActivities() {
        print(mode)
        if(day == nil) {
            activities = Activity.findSelectedActivities(moc!)
        }
        else {
            activities = Activity.findAllByDay(moc!, day: day!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelg = UIApplication.sharedApplication().delegate as! AppDelegate
        moc = appDelg.managedObjectContext
        print("ok")
        loadActivities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print(activities.count)
        return activities.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ProgramTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ProgramTableViewCell
        
        let activity = activities[indexPath.section]!
        cell.activity = activity
        cell.Name.text = activity.name
        cell.Speaker.setTitle(activity.speaker?.name, forState: UIControlState.Normal)
        //cell.Schedule.text = "\(activity.beginAtHour!)h\(activity.beginAtMinute!) - \(activity.endAtHour!)h\(activity.endAtMinute!)"
        cell.Schedule.text = "\(activity.beginAt) - \(activity.endAt)"
        cell.Place.text = activity.place?.name
        cell.ViewAction.tag = indexPath.section
        let selectTitle = activity.isSelected ? "Enlever de mon programme" : "Ajouter à mon programme"
        cell.SelectAction.setTitle(selectTitle, forState: .Normal)
        cell.SelectAction.addTarget(self, action: #selector(ProgramTableViewController.pressed(_:)), forControlEvents: .TouchUpInside)
        cell.SelectAction.tag = indexPath.section
        cell.ActionBar.backgroundColor = activity.isSelected ? UIColor.purpleColor() : UIColor.grayColor()
        
        return cell
    }
    
    func pressed(sender: UIButton!) {
        if let activity = activities[sender.tag] {
            let alertView = UIAlertView();
            alertView.addButtonWithTitle("Cool :)");
            alertView.title = (activity.name)!
            alertView.message = activity.isSelected ? "Activité enlevée de votre programme" : "Activité ajouté à votre programme";
            activity.isSelected = !(activity.isSelected)
            do {
                try moc!.save()
                loadActivities()
                self.tableView.reloadData()
            }
            catch {
            
            }
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.clearColor()
        return header
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDetails") {
            let controller = segue.destinationViewController as! ActivityDetailViewController
            let button = sender as! UIButton
            controller.activity = activities[button.tag]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
