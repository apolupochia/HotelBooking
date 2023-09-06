//
//  CoordinatorView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 31.08.2023.
//

import Foundation
import SwiftUI

struct CoordinatorView: View {
    @EnvironmentObject var coordinator : Coordinator
    private enum Field: Int, CaseIterable {
        case username, password
    }
    @FocusState private var focusedField: Field?
    var body: some View {

            NavigationStack(path: $coordinator.path) {
                coordinator.getPage(MyPages.hotel)
                    .navigationDestination(for: MyPages.self) { page in
                        coordinator.getPage(page)
                    }
            }
    }
}


