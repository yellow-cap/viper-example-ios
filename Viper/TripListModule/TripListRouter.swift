//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import SwiftUI

class TripListRouter {
    func makeDetailView(for trip: Trip, model: DataModel) -> some View {
        let presenter = TripDetailsPresenter(
                interactor: TripDetailsInteractor(
                        trip: trip,
                        model: model)
        )

        return TripDetailsView(presenter: presenter)
    }
}