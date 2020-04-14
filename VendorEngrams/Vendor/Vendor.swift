//
//  Vendor.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation

struct Vendor : Identifiable {
    var id: String
    
    let name : String
    let dropStatus : String
    
    init(name: String, dropStatus: String, id: String) {
        self.name = name
        self.dropStatus = dropStatus
        self.id = id
    }

}

extension Vendor: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "vendorID"
        case name = "shorthand"
        case dropStatus = "drop"
    }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let name: String = try container.decode(String.self, forKey: .name)
    let dropStatus: String = try container.decode(String.self, forKey: .dropStatus)
    let id: String = try container.decode(String.self, forKey: .id)
    
    let dropStatusString = { () -> String in  switch dropStatus {
    case "1":
        return "Low"
    case "2":
        return "High"
    default:
        return "No Data"
        }
    }()

    self.init(name: name.capitalizingFirstLetter(), dropStatus: dropStatusString, id: id)
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
