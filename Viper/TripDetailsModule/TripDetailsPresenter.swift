//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import Combine

class TripDetailsPresenter: ObservableObject {
    private let interactor: TripDetailsInteractor

    private var cancellables = Set<AnyCancellable>()

    init(interactor: TripDetailsInteractor) {
        self.interactor = interactor
    }
}
