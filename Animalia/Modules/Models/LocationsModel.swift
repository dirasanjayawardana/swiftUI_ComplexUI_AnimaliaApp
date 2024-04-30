//
//  LocationsModel.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import Foundation
import MapKit

struct LocationsModel: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
