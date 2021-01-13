//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import MapKit

class TripDetailsPresenter: ObservableObject {
    private let interactor: TripDetailsInteractor
    @Published var distanceLabel: String = "Calculating..."
    @Published var waypoints: [Waypoint] = []
    @Published var tripName: String = "No name"
    @Published var pins: [MKAnnotation] = []
    @Published var routes: [MKRoute] = []
    let setTripName: Binding<String>

    private var cancellables = Set<AnyCancellable>()

    init(interactor: TripDetailsInteractor) {
        self.interactor = interactor

        setTripName = Binding<String>(
                get: { interactor.tripName },
                set: { interactor.setTripName($0) }
        )

        interactor.tripNamePublisher
                .assign(to: \.tripName, on: self)
                .store(in: &cancellables)

        interactor.$totalDistance
                .map { "Total Distance: " + MeasurementFormatter().string(from: $0) }
                .replaceNil(with: "Calculating...")
                .assign(to: \.distanceLabel, on: self)
                .store(in: &cancellables)

        interactor.$waypoints
                .assign(to: \.waypoints, on: self)
                .store(in: &cancellables)

        interactor.$waypoints
                .map {
                    $0.map {
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = $0.location
                        return annotation
                    }
                }
                .assign(to: \.pins, on: self)
                .store(in: &cancellables)

        interactor.$directions
                .assign(to: \.routes, on: self)
                .store(in: &cancellables)
    }

    func save() {
        interactor.save()
    }
}
