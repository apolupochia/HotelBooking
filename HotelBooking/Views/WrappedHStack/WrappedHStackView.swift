

import SwiftUI

struct WrappedHStackView: View {
    let words : [String]

    var body: some View {
        TagsView(items: words)
    }
}

struct TagsView: View {
    
    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(items: [String]) {
        self.items = items
        self.groupedItems = CreateGroupedItems.shared.createGroupedItemsDoubleArray(items)
    }

    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(groupedItems, id: \.self) { subItems in
                HStack {
                    ForEach(subItems, id: \.self) { word in
                        Text(word)
                            .foregroundColor(Color(hex: "828796"))
                            .font(.custom("SF-Pro-Display-Medium", size: 16))
                            .padding(5)
                            .background(Color(hex: "FBFBFC"))
                            .cornerRadius(5)
                        
                    }
                }
            }
            
        }
        
    }
    
    
}

struct TestWrappedHStackView_Previews: PreviewProvider {
    static var previews: some View {
        WrappedHStackView(words: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"])
    }
}
