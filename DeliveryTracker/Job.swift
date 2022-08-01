//
//  Job.swift
//  DeliveryTracker
//
//  Created by Pal Makkar on 7/29/22.
//

import Foundation
import RadarSDK

struct Job: Identifiable, Codable, Hashable {
    var id: Int
    var title: String
    var dropoff_address: String
    var pictureString: String
    var time: String
    var distance: Double
    var description: String
    var driver: String
}


let joblist: [Job] = [
    .init(id: 3, title:"Office starter bundle", dropoff_address: "345 6th St, San Francisco, CA", pictureString: "studio-move", time: "12 PM, 7/4/22", distance: 0.5, description: "", driver: "1"),
    .init(id: 1, title: "Ping pong table", dropoff_address: "234 5th St, San Francisco, CA", pictureString: "ping-pong-table", time:"6 PM, 7/3/22", distance: 3, description: "", driver: "1"),
    .init(id: 2, title: "3 seater couch", dropoff_address: "567 8th St, San Francisco, CA", pictureString: "couch", time: "10 AM, 7/2/22", distance: 4, description: "", driver: "1"),
]


let acceptedjoblist: [Job] = [
    .init(id: 4, title: "80 inch TV", dropoff_address: "789 Market St, San Francisco, CA", pictureString: "tv", time: "4 PM, 7/1/22", distance: 2.5, description: "", driver: "1"),
    .init(id: 5, title:"Dining set", dropoff_address: "345 2nd St", pictureString: "dining-table", time: "1 PM, 7/1/22", distance: 0.5, description: "", driver: "1"),
]
