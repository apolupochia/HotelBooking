//
//  ProblemWithInternetView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 04.09.2023.
//

import SwiftUI

struct ProblemWithInternetView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .frame( width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height )
    }
}

struct ProblemWithInternetView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemWithInternetView()
    }
}
