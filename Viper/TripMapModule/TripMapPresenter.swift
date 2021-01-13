//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import Combine
import MapKit

class TripMapPresenter: ObservableObject {
    @Published var pins: [MKAnnotation] = []
    @Published var routes: [MKRoute] = []

    let interactor: TripMapInteractor

    init(interactor: TripMapInteractor) {
        self.interactor = interactor
    }
}