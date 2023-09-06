//
//  CarouselOfPhotosView.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 30.08.2023.
//

import SwiftUI

struct CarouselOfPhotosView: View {
    let carousel : [UIImage]?
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width , height: 277)
                .background(Color.white)
                .foregroundColor(.white)
                .cornerRadius(12)
            if (carousel != nil) {
                TabView {
                    ForEach(carousel!, id: \.self){image in

                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(15)
                            .frame(height: 257)
                            .frame(maxWidth: UIScreen.main.bounds.width )
                            .padding(.horizontal)

                    }
                    
                }

                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(width: UIScreen.main.bounds.width - 10, height: 257)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .cornerRadius(15)
                    .frame(height: 257)
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width - 10, height: 257)
            }
            
 
        }

    }
}

struct CarouselOfPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselOfPhotosView(carousel: nil)
    }
}
