//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import SwiftUI

struct TripDetailsView: View {
    @ObservedObject var presenter: TripDetailsPresenter

    var body: some View {
        return Text("V")
    }
}

#if DEBUG
struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        let trip = model.trips[1]
        let mapProvider = RealMapDataProvider()
        let presenter = TripDetailsPresenter(
                interactor: TripDetailsInteractor(
                        trip: trip,
                        model: model,
                        mapInfoProvider: mapProvider)
        )

        return NavigationView {
            TripDetailsView(presenter: presenter)
        }
    }
}
#endif