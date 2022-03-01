//
//  ListFicheTechniqueIntent.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 01/03/2022.
//

import Foundation

enum ListFicheTechniqueIntent: CustomStringConvertible, Equatable {
    case ready
    case changingListFT
    case changedListFT
    
    var description: String{
        switch self {
            case .ready: return "state: .ready"
            case .changingListFT: return "state: .ready to .changingListFT"
            default: return ""
        }
    }
    
    mutating func intentToChange() {
        self = .changingListFT
        print("ListFicheTechniqueIntent: .ready to .changingListFT")
    }
    
    mutating func endOfIntent() {
        self = .ready
    }
}
