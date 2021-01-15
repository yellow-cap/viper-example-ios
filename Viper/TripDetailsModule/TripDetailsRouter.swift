//
// Created by Artem on 15.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import SwiftUI

class TripDetailRouter {
    private let mapProvider: MapDataProvider

    init(mapProvider: MapDataProvider) {
        self.mapProvider = mapProvider
    }

    func makeWaypointView(for waypoint: Waypoint) -> some View {
        let presenter = WaypointViewPresenter(
                waypoint: waypoint,
                interactor: WaypointViewInteractor(
                        waypoint: waypoint,
                        mapInfoProvider: mapProvider))
        return WaypointView(presenter: presenter)
    }
}