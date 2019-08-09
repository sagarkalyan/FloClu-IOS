//
//  HelpListViewController.swift
//  FloClu
//
//  Created by Ashish Ashish on 2019-07-30.
//  Copyright © 2019 capstoneProject. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class HelpListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    
    fileprivate var alertStyle: UIAlertController.Style = .actionSheet

    
//    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableViewsShow: UITableView!
    
    
    var arrdata = [jsonstruct]()
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        ============ current location version 1  start ==========
        
        
        //        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //            let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        //
        ////            item1.text = String(userLocation.coordinate.latitude)
        ////            item2.text = String(userLocation.coordinate.longitude)
        ////
        //
        //
        //            let width = 1000.0
        //            let height = 1000.0
        //
        //            let region = MKCoordinateRegion(center: center, latitudinalMeters: width, longitudinalMeters: height)
        //            mapView.setRegion(region, animated: true)
        //        }
        //
        //
        
        //            ============ current location version 1 ends  ==========
        
        
        
        //        ============ current location version 2 start  ==========
        
//        self.locationManager.requestWhenInUseAuthorization()
//        
//        if CLLocationManager.locationServicesEnabled() {
//            
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
//        }
        
        
        
        
        //    ============ current location version 2 ends  ==========
        
        // ============= map location and destination start =====================
        // Do any additional setup after loading the view.
        
        //        let sourceLocation = CLLocationCoordinate2D(latitude:39.173209 , longitude: -94.593933)
        ////        let destinationLocation = CLLocationCoordinate2D(latitude:38.643172 , longitude: -90.177429)
        //
        //        let sourcePin = customPin(pinTitle: "Kansas City", pinSubTitle: "", location: sourceLocation)
        ////        let destinationPin = customPin(pinTitle: "St. Louis", pinSubTitle: "", location: destinationLocation)
        //        self.mapView.addAnnotation(sourcePin)
        ////        self.mapView.addAnnotation(destinationPin)
        //
        //        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        ////        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        //
        //        let directionRequest = MKDirections.Request()
        //        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        ////        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        //        directionRequest.transportType = .automobile
        //
        //        let directions = MKDirections(request: directionRequest)
        //        directions.calculate { (response, error) in
        //            guard let directionResonse = response else {
        //                if let error = error {
        //                    print("we have error getting directions==\(error.localizedDescription)")
        //                }
        //                return
        //            }
        //
        //            let route = directionResonse.routes[0]
        //            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
        //
        //            let rect = route.polyline.boundingMapRect
        //            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        //        }
        //
        //        self.mapView.delegate = self
        
        // =============== map location and destination end ==============
        //    =========== get data function =================
        getdata()
    }
    
    
    func getdata(){
        
        
        let url = URL(string: "https://floclu.ca/services.php")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for element in self.arrdata{
                    print(element.id as Any,":",element.latitude as Any,":",element.longitude as Any, element.username as Any, element.userid as Any, element.distance as Any)
                    DispatchQueue.main.async {
                        self.tableViewsShow.reloadData()
                    }
                    
                }
                }
                
            }catch let jsonErr
                
            {
                print("Error Serialize", jsonErr)
            }
            
            }.resume()
        
        
    }
    
    let myId =  UserDefaults.standard.string(forKey: "myID")
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableCellTableViewCell
        cell.longLabel.text = "Name : \(String( arrdata[indexPath.row].username!))"
        cell.latLabel.text = "Distance: \(arrdata[indexPath.row].distance!) kms"
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detail:MapLinkDirectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "linkLocation") as! MapLinkDirectionViewController
//
        
//        detail.otherLatitude = (arrdata[indexPath.row].latitude!)
//        detail.otherLongitude = (arrdata[indexPath.row].longitude!)
//
//
//        self.navigationController?.pushViewController(detail, animated: true)
        
        let alert = UIAlertController(style: self.alertStyle)
        alert.addLocationPicker { location in print("chgfghf466099--=0897r6767909089086785",location) }
        alert.addAction(title: "Cancel", style: .cancel)
        self.present(alert, animated: true, completion: nil)
//
        
    }
    
    
    //    ==================== Current location version 1 part 2 start =================
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKPolylineRenderer(overlay: overlay)
//        renderer.strokeColor = UIColor.blue
//        renderer.lineWidth = 4.0
//        return renderer
//    }
    //
    
    //    ==================== current location version 1 part 2 ends ===================
    
    //    ======================== current locdation version 2 part 2 start ============
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
//        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//        let userLocation = locations.last
//        let viewRegion = MKCoordinateRegion.init(center: (userLocation?.coordinate)!, latitudinalMeters: 600, longitudinalMeters: 600)
////        self.mapView.setRegion(viewRegion, animated: true)
    }
    
    
    //    ======================== current locdation version 2 part 2 ends ============
    
    
