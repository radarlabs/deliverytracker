//
//  ContentView.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 7/29/22.
//

import SwiftUI
import RadarSDK

struct JobListView: View {
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading) {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(acceptedjoblist, id: \.id) { album in
                                    DispatchJobCard(job: album)
                                }
                            }.frame(height: 400)
                        }
                        Text("Scheduled Deliveries")
                            .font(.largeTitle)
                            .bold()
                        VStack {
                            ForEach(joblist, id: \.id) { album in
                                JobCard(job: album)
                            }
                        }
                    }.padding()
                }.navigationBarTitle("Today's Deliveries")
            }
        }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        JobListView()
    }
}
