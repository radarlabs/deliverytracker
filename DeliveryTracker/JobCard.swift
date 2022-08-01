//
//  AcceptedJobCard.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 7/29/22.
//

import SwiftUI

struct JobCard: View {
    var job: Job
        
        var body: some View {
            NavigationLink(destination: JobDetailView(job: job)) {
                HStack {
                    Image(job.pictureString)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:40, height: 40)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(job.title)
                            .font(.headline)
                        Text(job.time)
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                    }
                    Spacer()
    
                }.padding()
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), lineWidth: 1)
                )
                .shadow(radius: 1)
            }
        }
}

struct MoreButtonView: View {
    var job: Job
    
    var body: some View {
        NavigationLink(destination: JobDetailView(job: job)){
        VStack {
                Circle().frame(width: 5, height: 5)
                Circle().frame(width: 5, height: 5)
                Circle().frame(width: 5, height: 5)
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct JobCard_Previews: PreviewProvider {
    static var previews: some View {
            JobCard(job: joblist[1])
                .previewLayout(.fixed(width: 380, height: 75))
        }
}
