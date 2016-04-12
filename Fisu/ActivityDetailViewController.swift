//
//  DetailViewController.swift
//  Fisu
//
//  Created by Mehdi Chamouma on 11/04/2016.
//  Copyright © 2016 Mehdi Chamouma. All rights reserved.
//

import UIKit
import MapKit

class ActivityDetailViewController: UIViewController,  MKMapViewDelegate {
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var SpeakerBio: UILabel!
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var SpeakerProfession: UILabel!
    @IBOutlet weak var SpeakerButton: UIButton!
    @IBOutlet weak var Schedule: UILabel!
    var activity : Activity?


    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = activity?.name!
        Description.text = activity?.descr
        SpeakerBio.text = activity?.speaker?.bio
        SpeakerProfession.text = activity?.speaker?.profession
        Schedule.text = "\(activity!.beginAt) - \(activity!.endAt)"
        SpeakerButton.setTitle(activity?.speaker?.name, forState: .Normal)
        let lat = activity?.place?.latitude?.doubleValue
        let lng = activity?.place?.longitude?.doubleValue
        let location = CLLocationCoordinate2DMake(lat!, lng!)
        let region = MKCoordinateRegionMakeWithDistance(location, 1000, 1000)
        Map.region = region
        Map.delegate = self
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        dropPin.title = activity!.place?.name
        Map.addAnnotation(dropPin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

