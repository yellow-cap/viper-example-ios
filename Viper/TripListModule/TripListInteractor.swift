//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation

class TripListInteractor {
    let model: DataModel

    init(model: DataModel) {
        self.model = model
    }

    func addNewTrip() {
        model.pushNewTrip()
    }

    func deleteTrip(_ index: IndexSet) {
        model.trips.remove(atOffsets: index)
    }
}
