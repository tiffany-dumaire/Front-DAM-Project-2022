//
//  UtilDTO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 02/03/2022.
//

import Foundation

struct UtilDTO: Decodable {
    var insertId: Int
    var changedRows: Int
    
    init(insertId: Int, changedRows: Int) {
        self.insertId = insertId
        self.changedRows = changedRows
    }
}
