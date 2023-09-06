//
//  CreateGroupedItems.swift
//  HotelBooking
//
//  Created by Алёша Виноградов on 04.09.2023.
//

import Foundation
import SwiftUI


struct CreateGroupedItems{
    
    static let shared = CreateGroupedItems()
    
    let screenWidth = UIScreen.main.bounds.width
    

    func createGroupedItemsDoubleArray(_ items: [String]) -> [[String]] {
        
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] =  [String]()
        var width: CGFloat = 0
        
        for word in items {
            
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 10
            
            if (width + labelWidth + 55) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
            
        }
        
        groupedItems.append(tempItems)
        return groupedItems
        
    }
    
    func createGroupedItemsArray(items : [String]) -> [String] {
        
        let items: [String] = items
        let screenWidth = UIScreen.main.bounds.width
        var groupedItems: [String] = [String]()
        var tempItems: String =  ""
        var width: CGFloat = 0
            
            for word in items {
                
                let label = UILabel()
                label.text = word
                label.sizeToFit()
                
                let labelWidth = label.frame.size.width + 10
                
                if (width + labelWidth + 55) < screenWidth {
                    width += labelWidth
             
                    tempItems = tempItems + " \(word)"
                } else {
                    width = labelWidth
                    groupedItems.append(tempItems)
                    tempItems.removeAll()
                    tempItems = tempItems + " \(word)"
                }
                
            }
            
            groupedItems.append(tempItems)

            return groupedItems

    }

}

