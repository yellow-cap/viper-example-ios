//
// Created by Artem on 13.01.2021.
// Copyright (c) 2021 Ray Wenderlich. All rights reserved.
//

import Foundation
import SwiftUI

struct TripListView: View {
    @ObservedObject var presenter: TripListPresenter

    var body: some View {
        List {
            ForEach (presenter.trips, id: \.id) { item in
                TripListCell(trip: item)
                        .frame(height: 240)
            }
        }
                .navigationBarTitle("Roadtrips", displayMode: .inline)
                .navigationBarItems(trailing: presenter.makeAddNewButton())
    }
}

#if DEBUG
struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DataModel.sample
        let interactor = TripListInteractor(model: model)
        let presenter = TripListPresenter(interactor: interactor)

        return NavigationView {
            TripListView(presenter: presenter)
        }
    }
}
#endif