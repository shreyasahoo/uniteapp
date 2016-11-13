//
//  NewProtestViewController.swift
//  protestapp
//
//  Created by Shreya Sahoo on 11/12/16.
//  Copyright © 2016 Shreya Sahoo. All rights reserved.
//

import UIKit;
//geocoding
import CoreLocation;
import AddressBookUI;
import MapKit;


class NewProtestViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    
    var mapViewController: MapViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitTapped(_ sender: AnyObject) {
        
        let address = mapViewController.addressTextField.text!
        
        forwardGeocoding(address: address, completionHandler: {
          location in
            let coordLatLon = location.coordinate
            
            
            let latitude  = coordLatLon.latitude
            let longitude = coordLatLon.longitude
            let name = self.nameTextField.text!
            let description = self.descriptionTextField.text!
            let startTime = self.startTimePicker.date
            
            let protest = Protest(name: name, description: description, latitude: latitude, longitude: longitude, address: address, startTime: startTime)
            self.mapViewController.newProtestCreated(protest: protest)
        })
        
    }
    
    func forwardGeocoding(address: String, completionHandler: @escaping (CLLocation) -> ()) {
        CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if error != nil {
                print(error!)
            }
            if (placemarks?.count)! > 0 {
                let placemark = placemarks?[0]
                let location = placemark?.location
//                let coordinate = location?.coordinate
//                print("\nlat: \(coordinate!.latitude), long: \(coordinate!.longitude)")
                completionHandler(location!)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
