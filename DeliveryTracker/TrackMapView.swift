//
//  TrackMapView.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 8/3/22.
//

import SwiftUI
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct TrackMapView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: locationManager.currentLocation == nil ? [] :
                        [Marker(location: MapMarker(coordinate: locationManager.currentLocation!.coordinate, tint: .red))])
                {
                    marker in marker.location
                    
                }.ignoresSafeArea()
                .accentColor(Color(.systemBlue))
                    
                Text("ETA: \(locationManager.eta) minutes")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    
            }
        }
        
    }
}

struct TrackMapView_Previews: PreviewProvider {
    static var previews: some View {
        TrackMapView()
    }
}
