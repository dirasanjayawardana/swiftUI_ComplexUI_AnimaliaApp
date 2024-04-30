//
//  MapView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Region
    @State private var region: MKCoordinateRegion = {
        // center map
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        // zoom level (span)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta:70.0, longitudeDelta: 70.0)
        // get map region
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    // MARK: Properties
    let locations: [LocationsModel] = Bundle.main.decode("locations.json")
    
    var body: some View {
        ZStack(alignment: .top) {
            // MARK: Basi Map
            // Map(coordinateRegion: $region)
            
            // MARK: Advance Map
            Map(coordinateRegion: $region, annotationItems: locations) { item in
                // Old Style
                // MapPin(coordinate: item.location, tint: .accent)
                
                // New Style
                // MapMarker(coordinate: item.location, tint: .accent)
                
                // Custom Basic Map
                // MapAnnotation(coordinate: item.location) {
                //     Image(.logo)
                //         .resizable()
                //         .scaledToFit()
                //         .frame(width: 32, height: 32)
                // }
                
                // Custom Basic Map
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            }
            
            // MARK: Inset Location
            Group {
                HStack(spacing: 12) {
                    Image(.compass)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    
                    VStack {
                        HStack {
                            Text("Latitiude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.accent)
                            
                            Spacer()
                            
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.accent)
                            
                            Spacer()
                            
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black.clipShape(RoundedRectangle(cornerRadius: 12)).opacity(0.6))
            }
            .padding()
        }
    }
}

#Preview {
    MapView()
}
