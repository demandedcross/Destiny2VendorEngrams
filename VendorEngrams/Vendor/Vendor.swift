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
    let displayStatus: Bool
    
    init(name: String,
         dropStatus: String,
         id: String,
         displayStatus:Bool) {
        self.name = name
        self.dropStatus = dropStatus
        self.id = id
        self.displayStatus = displayStatus
    }

}

extension Vendor: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "vendorID"
        case name = "shorthand"
        case dropStatus = "drop"
        case displayStatus = "display"
    }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let name: String = try container.decode(String.self, forKey: .name)
    let dropStatus: String = try container.decode(String.self, forKey: .dropStatus)
    let id: String = try container.decode(String.self, forKey: .id)
    let displayStatus: String = try container.decode(String.self, forKey: .displayStatus)

    
    let displayStatusBool = { () -> Bool in switch displayStatus {
    case "1":
        return true
    default:
        return false
        
        }
        
    }()

    self.init(name: name, dropStatus: dropStatus, id: id, displayStatus: displayStatusBool)
  }
}
