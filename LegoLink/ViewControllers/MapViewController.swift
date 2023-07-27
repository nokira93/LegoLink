//
//  MapViewController.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 09/07/2023.
//

import UIKit
import MapKit
import CoreLocation
import Combine
import SwiftUI

class MapViewController: UIViewController, MKMapViewDelegate {

    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
//    var coordinate = CLLocationCoordinate2D(latitude: 53.4399892384303, longitude: 14.578446459366214)
    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @StateObject var deviceLocationService = UserLocationController.shared
    @State var tokens: Set<AnyCancellable> = []
//    @State var coordinates: (lat: Double, lon: Double) = (0, 0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setMapConstraints()
        addAnnotation()
        mapView.setRegion(MKCoordinateRegion(center: coordinate,
                                             span: MKCoordinateSpan(
                                                latitudeDelta: 0.01,
                                                longitudeDelta: 0.01
                                             )
                                            ),
                          animated: false)
        
        observeCoordinateUpdates()
        obserLocationAccessDenied()
        deviceLocationService.requestLocationUpdates()
    }
    
    
    private func setMapConstraints() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    func addAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.title = "Lego Shop"
        annotation.subtitle = "Shop with Lego bricks"
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 53.4399892384303, longitude: 14.578446459366214)
        annotation.coordinate = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: "LegoFigure")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "LegoFigure")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "legoFigure")
        let ratio:Double = 320 / 576
        let sizePOI:Double = 85.0
        annotationView?.frame = CGRect(x: 0, y: 0, width: sizePOI * ratio, height: sizePOI)
        return annotationView
    }
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { coordinates in
                self.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
            }
            .store(in: &tokens)
    }
    
    func obserLocationAccessDenied() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("Error")
            }
            .store(in: &tokens)
    }
}
