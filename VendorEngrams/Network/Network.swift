//
//  Network.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation

class Network {
    
    var network : SomeNetworkProtocol
    
    let endpoint = "https://api.vendorengrams.xyz/getVendorDrops"
    
    init(network: SomeNetworkProtocol) {
        self.network = network
    }
    
    func getVendors() {
        self.network.makeRequest(url: endpoint, completionHandler: {_ in
            
        })
    }
}
