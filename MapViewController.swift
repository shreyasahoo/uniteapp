//
//  FirstViewController.swift
//  protestapp
//
//  Created by Shreya Sahoo on 11/12/16.
//  Copyright © 2016 Shreya Sahoo. All rights reserved.
//

import UIKit

import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addProtestButton: UIButton!
    
    var NewProtestViewController: NewProtestViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(34.00, 43.01)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Berkeley"
        annotation.subtitle = "CalHacks"
        mapView.addAnnotation(annotation)
        
        
    }

    
    @IBAction func addProtestButtonPressed(_ sender: AnyObject){

        let newProtestController = storyboard!.instantiateViewController(withIdentifier: "newProtestController") as! NewProtestViewController
        newProtestController.mapViewController = self
        present(newProtestController, animated: true, completion: nil)
        
        resignFirstResponder()
    }

    func newProtestCreated(protest: Protest) {
        dismiss(animated: true, completion: nil)
        print("\(protest.name)")
    }
    
}


