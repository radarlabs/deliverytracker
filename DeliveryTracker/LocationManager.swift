//
//  LocationManager.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 8/4/22.
//

import Foundation
import RadarSDK
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, RadarDelegate {
    
    var notificationManager = LocalNotificationManager()
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 37.7897, longitude: -122.3972
    ), span: MKCoordinateSpan(
        latitudeDelta: 0.1, longitudeDelta: 0.1
    ))
    @Published var eta = 0
    @Published var onTrip = false
    @Published var currentLocation: CLLocation?
    var activeTrip = ""
    
    let locationManager = CLLocationManager()
    static let shared = LocationManager()
    
    override init() {
        super.init()
        print("in the app delegate")
        Radar.initialize(publishableKey: "prj_live_pk...")
        Radar.setDelegate(self)
        
        self.locationManager.requestWhenInUseAuthorization()
    
        self.locationManager.delegate = self
        self.requestLocationPermissions()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.requestLocationPermissions()
    }
    
    func requestLocationPermissions() {
        let status = CLLocationManager.authorizationStatus()

        if status == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        if status == .authorizedAlways || status == .authorizedWhenInUse {
        }
    }
    
    func updateCurrentLocation(event: RadarEvent) {
        currentLocation = event.location
        region = MKCoordinateRegion(center: event.location.coordinate, span: MKCoordinateSpan(
            latitudeDelta: 0.1, longitudeDelta: 0.1))
        if event.trip != nil {
            eta = Int(event.trip!.etaDuration)
        }
    }

    func startOrStopTrip(job: Job) {
        print(job.title)
        
        if !onTrip {
            let uuid = UUID().uuidString
            
            let tripOptions = RadarTripOptions(
                        externalId: String(uuid),
                        destinationGeofenceTag:"office",
                        destinationGeofenceExternalId: "salesforce"
                    )
            tripOptions.mode = .car
            tripOptions.metadata = [
                "Pickup Title": job.title,
                "Vehicle": "Green Ford pickup truck"
            ]

            Radar.startTrip(options: tripOptions)
            
    //        Radar.startTracking(trackingOptions: .presetContinuous)
            Radar.mockTracking(
              origin: CLLocation(latitude: 37.769722, longitude: -122.476944), // golden gate park
              destination: CLLocation(latitude: 37.7897442, longitude: -122.3972337),
              mode: .car,
              steps: 10,
              interval: 2) { (status, location, events, user) in
                  print("mocktrack", status, location)
            }
            
            activeTrip = uuid
            
            print("Starting trip!", activeTrip)
            print(job.title)
            onTrip = true
        } else {
            Radar.cancelTrip()
            Radar.stopTracking()
            print("Cancelling trip", activeTrip)
            onTrip = false
        }
        
        print("on trip: ", onTrip)
    }
    
    //Radar
    func didReceiveEvents(_ events: [RadarEvent], user: RadarUser?) {
        for event in events {
            print("new event", event.type, event.description, event._id)
            
            if event.type == RadarEventType.userStartedTrip {
                print("Started trip notification!")
                updateCurrentLocation(event: event)
                
                self.notificationManager.sendNotification(title: "Order A is on its way!", subtitle: nil, body: "Driver 1 is headed toward the destination with order A.", launchIn: 0.1)
            }
            if event.type == RadarEventType.userApproachingTripDestination {
                
                print("Notify Approaching!")
                
                updateCurrentLocation(event: event)
                
                self.notificationManager.sendNotification(title: "Order A is approaching the destination!", subtitle: nil, body: "Driver 1 is " + String(eta) + " minutes away. The order will be delivered soon.", launchIn: 0.1)
            }
            
            if event.type == RadarEventType.userArrivedAtTripDestination {
                print("Arrived notification!")
                
                updateCurrentLocation(event: event)
                
                self.notificationManager.sendNotification(title: "Order A is being dropped off!", subtitle: nil, body: "Driver 1 has arrived at the destination.", launchIn: 0.1)
                
                Radar.completeTrip()
                Radar.stopTracking()
                print("completed trip", activeTrip)
                onTrip = false
                activeTrip = ""
            }
            
            if event.type == RadarEventType.userUpdatedTrip {
                print("Location Update", event.location.coordinate)
                updateCurrentLocation(event: event)
            }
            
            

        }
    }
    
    func didUpdateLocation(_ location: CLLocation, user: RadarUser) {
        return
    }
    
    func didUpdateClientLocation(_ location: CLLocation, stopped: Bool, source: RadarLocationSource) {
        return
    }
    
    func didFail(status: RadarStatus) {
        print("radar failure", status)
    }
    
    func didLog(message: String) {
        return
    }
}

