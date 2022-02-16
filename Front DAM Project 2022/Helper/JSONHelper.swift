//
//  JSONHelper.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import Foundation

struct JSONHelper {
    static func loadFromFile(name: String, ext: String) -> Data? {
        if let fileURL = Bundle.main.url(forResource: name, withExtension: ext) {
            if let content = try? Data(contentsOf: fileURL) {
                return content
            }
        }
        return nil
    }
    
    static func decode<T: Decodable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode(T.self, from: data) {
            return decoded
        }
        return nil
    }
    
}
