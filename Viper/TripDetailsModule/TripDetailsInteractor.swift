//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import Combine
import MapKit

class TripDetailsInteractor {
    private let trip: Trip
    private let model: DataModel
    var tripName: String { trip.name }
    var tripNamePublisher: Published<String>.Publisher { trip.$name }
    let mapInfoProvider: MapDataProvider
    @Published var totalDistance: Measurement<UnitLength> =
            Measurement(value: 0, unit: .meters)
    @Published var waypoints: [Waypoint] = []
    @Published var directions: [MKRoute] = []

    private var cancellables = Set<AnyCancellable>()

    init (mapInfoProvider: MapDataProvider, trip: Trip, model: DataModel) {
        self.trip = trip
        self.model = model
        self.mapInfoProvider = mapInfoProvider

        trip.$waypoints
                .assign(to: \.waypoints, on: self)
                .store(in: &cancellables)

        trip.$waypoints
                .flatMap { mapInfoProvider.totalDistance(for: $0) }
                .map { Measurement(value: $0, unit: UnitLength.meters) }
                .assign(to: \.totalDistance, on: self)
                .store(in: &cancellables)

        trip.$waypoints
                .setFailureType(to: Error.self)
                .flatMap { mapInfoProvider.directions(for: $0) }
                .catch { _ in Empty<[MKRoute], Never>() }
                .assign(to: \.directions, on: self)
                .store(in: &cancellables)
    }

    func setTripName(_ name: String) {
        trip.name = name
    }

    func save() {
        model.save()
    }

    func addWaypoint() {
        trip.addWaypoint()
    }

    func moveWaypoint(fromOffsets: IndexSet, toOffset: Int) {
        trip.waypoints.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }

    func deleteWaypoint(atOffsets: IndexSet) {
        trip.waypoints.remove(atOffsets: atOffsets)
    }

    func updateWaypoints() {
        trip.waypoints = trip.waypoints
    }
}