//
//  JobDetailView.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 7/29/22.
//

import SwiftUI

struct JobDetailView: View {
    var job: Job
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
                            Text("Dropoff Address")
                                .font(.headline)
                                .foregroundColor(.accentColor)
                            Text(job.dropoff_address)
                                .font(.subheadline)
                            Spacer()
                        }.padding()
                        Text(job.description)
                            .font(.subheadline)
                            .padding([.leading, .trailing])
                        HStack {
                            Text("Assigned Driver")
                                .font(.headline)
                                .foregroundColor(.accentColor)
                            Text("None")
                                .font(.subheadline)
                            Spacer()
                        }.padding()
                        
                        Spacer()
                        Button {
                            print("Accepted")
                        } label: {
                            Text("Assign")
                                .padding(5)
                        }.buttonStyle(.bordered)
                        .contentShape(Rectangle())
                    }.navigationBarTitle("Delivery Details")
                        .padding()
            }.accentColor(.red)
        }
}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
            JobDetailView(job: joblist[1])
        }
}
