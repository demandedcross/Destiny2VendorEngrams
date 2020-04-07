//
//  VendorInteractor.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation

class VendorInteractor {
    var network : Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getVendors() -> [Vendor] {
        network.getVendors()
        
        return [Vendor()]
    }
}
