//
//  ContentView.swift
//  MapKitDemo
//
//  Created by Emin Sahin on 18.07.23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let uniWien = CLLocationCoordinate2D(
        latitude: 48.213349904351425,
        longitude: 16.360093313277204
    )
    
    let votivKino = CLLocationCoordinate2D(
        latitude: 48.21696729898015,
        longitude: 16.3604902800422
    )
    
    let parlament = CLLocationCoordinate2D(
        latitude: 48.20820218289815,
        longitude: 16.35977144851028
    )
    
    @State private var camera: MapCameraPosition = .automatic
    @State private var selectedLocation: CLLocationCoordinate2D?
    
    var body: some View {
        Map(
            position: $camera
        ) {
            Marker(
                "Uni Wien",
                systemImage: "building.2",
                coordinate: uniWien
            )
            Marker(
                "Votiv Kino",
                coordinate: votivKino
            ).tint(
                .purple
            )
            Marker(
                "Parlament",
                systemImage: "building.columns",
                coordinate: parlament
            )
        }
        .onAppear {
            camera = .region(
                MKCoordinateRegion(
                    center: uniWien,
                    latitudinalMeters: 200,
                    longitudinalMeters: 200
                )
            )
            selectedLocation = uniWien
        }
        .safeAreaInset(
            edge: .bottom
        ) {
            HStack {
                Spacer(
                )
                
                Button(action: {
                    withAnimation {
                        camera = .region(
                            MKCoordinateRegion(
                                center: uniWien,
                                latitudinalMeters: 200,
                                longitudinalMeters: 200
                            )
                        )
                        selectedLocation = uniWien
                    }
                }) {
                    HStack {
                        Image(
                            systemName: "building.2"
                        )
                        Text(
                            "Uni Wien"
                        )
                        .font(
                            .headline
                        )
                    }
                }
                .foregroundColor(
                    .white
                )
                .padding(
                )
                .background(
                    Color.accentColor
                )
                .cornerRadius(
                    10
                )
                Button(action: {
                    withAnimation {
                        camera = .region(
                            MKCoordinateRegion(
                                center: parlament,
                                latitudinalMeters: 200,
                                longitudinalMeters: 200
                            )
                        )
                        selectedLocation = parlament
                    }
                }) {
                    HStack {
                        Image(
                            systemName: "building.columns"
                        )
                        Text(
                            "Parlament"
                        )
                        .font(
                            .headline
                        )
                    }
                }
                .foregroundColor(
                    .white
                )
                .padding(
                )
                .background(
                    Color.accentColor
                )
                .cornerRadius(
                    10
                )
                Spacer(
                )
            }
            .padding(
                .top
            )
            .background(
                .thinMaterial
            )
        }
    }
}

#Preview {
    ContentView(
    )
}
