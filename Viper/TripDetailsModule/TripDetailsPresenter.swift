//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class TripDetailsPresenter: ObservableObject {
    private let interactor: TripDetailsInteractor
    @Published var tripName: String = "No name"
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

    }

    func save() {
        interactor.save()
    }
}
