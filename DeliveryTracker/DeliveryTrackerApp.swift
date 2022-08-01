//
//  PickUp_DriverApp.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 7/29/22.
//

import SwiftUI
import RadarSDK
import MapKit

@main
struct DeliveryTrackerApp: App {

    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some Scene {
        WindowGroup {
            JobListView()
        }
    }
}
