//
//  InsetMapView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    //    @State private var cameraPossition = MapCameraPosition.region(MKCoordinateRegion(
    //        center: CLLocationCoordinate2D(latitude: 4.1772, longitude: 113.99422),
    //        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    //    ))
    
    @State private var cameraPosition: MapCameraPosition = {
        let centerCoordinate = CLLocationCoordinate2D(latitude: 4.17727, longitude: 113.99422)
        
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        
        let region = MKCoordinateRegion(center: centerCoordinate, span: coordinateSpan)
        
        return MapCameraPosition.region(region)
    }()
    
    var body: some View {
        // Map { Marker("Borneo", coordinate: .borneo) }
        
        ZStack(alignment: .topTrailing) {
            Map(position: $cameraPosition)
                .frame(height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            HStack {
                Image(systemName: "mappin.circle")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                
                Text("Locations")
                    .foregroundStyle(.accent)
                    .padding(.horizontal, 14)
                    
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(
                Color.black
                    .opacity(0.4)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            )
            .padding(12)
        }
    }
}

#Preview {
    InsetMapView()
}
