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
    let mapInfoProvider: MapDataProvider

    private var cancellables = Set<AnyCancellable>()

    init (trip: Trip, model: DataModel, mapInfoProvider: MapDataProvider) {
        self.trip = trip
        self.mapInfoProvider = mapInfoProvider
        self.model = model
    }
}