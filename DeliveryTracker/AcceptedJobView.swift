//
//  JobView.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 7/29/22.
//

import SwiftUI

struct DispatchJobCard: View {
    var job: Job
    
    var body: some View {
        NavigationLink(destination: DispatchJobDetailView(job: job)){
            VStack {
                Image(job.pictureString)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 300)
                VStack{
                    Text(job.title)
                        .font(.headline)
                        .lineLimit(2)
                    Text(job.time)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                Spacer()
            }
            .frame(height: 400)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
            .shadow(radius: 1)
        }
    }
}

struct AcceptedJobCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DispatchJobCard(job: joblist[0])
                .previewLayout(.fixed(width: 300, height: 510))
        }
    }
}
