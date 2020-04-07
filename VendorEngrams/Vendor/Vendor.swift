//
//  Vendor.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation

struct Vendor {
    let name : String
    let dropStatus : String = "Low"
    
    init(name: String) {
        self.name = name
    }

}

extension Vendor: Decodable {
  enum CodingKeys: String, CodingKey {
         case name = "shorthand"
    }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let name: String = try container.decode(String.self, forKey: .name)
//    let dropStatus: String = try container.decode(Int.self, forKey: .id)
//
    self.init(name: name.capitalizingFirstLetter())
  }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
