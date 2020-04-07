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
    let dropStatus : String
    
    init(name: String, dropStatus: String) {
        self.name = name
        self.dropStatus = dropStatus
    }

}

extension Vendor: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "shorthand"
        case dropStatus = "drop"
    }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let name: String = try container.decode(String.self, forKey: .name)
    let dropStatus: String = try container.decode(String.self, forKey: .dropStatus)
    
    let dropStatusString = { () -> String in  switch dropStatus {
    case "1":
        return "Low"
    case "2":
        return "High"
    default:
        return "No Data"
        }
    }()

    self.init(name: name.capitalizingFirstLetter(), dropStatus: dropStatusString)
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
