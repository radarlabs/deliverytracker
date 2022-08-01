//
//  AcceptedJobDetailView.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 8/1/22.
//

import SwiftUI

struct DispatchJobDetailView: View {
    var job: Job
    @State private var isShowingDetailView = false
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
            ScrollView {
                VStack {
                    Image(job.pictureString)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .cornerRadius(8)
                    HStack {

                        Text(job.title)
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        Spacer()
                    }.padding([.leading, .trailing])
                    HStack {
                        Text("Time")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        Text(job.time)
                            .font(.subheadline)
                        Spacer()
                    }.padding()
                    HStack {
                        Text("Assigned Driver")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        Text(job.driver)
                            .font(.subheadline)
                        Spacer()
                    }.padding()
                    HStack {
                        Text("Dropoff Address")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        Text(job.dropoff_address)
                            .font(.subheadline)
                        Spacer()
                    }.padding()
                    
                    Spacer()
                    VStack {
                        NavigationLink(destination: TrackMapView(), isActive: $isShowingDetailView) { EmptyView() }
                        
                        Button {
                            locationManager.startOrStopTrip(job: job)
                            isShowingDetailView = true
                        } label: {
                            Text(locationManager.onTrip ? "Cancel" : "Start")
                                .padding(5)
                        }.buttonStyle(.bordered)
                        .contentShape(Rectangle())
                    }
                }.navigationBarTitle("Delivery Details")
                    .padding()
        }.accentColor(.red)
    }
}

struct AcceptedJobDetailView_Previews: PreviewProvider {
    static var previews: some View {
            DispatchJobDetailView(job: joblist[1])
        }
}
