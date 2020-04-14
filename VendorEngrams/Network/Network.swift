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
    
    func getVendors(completionHandler: @escaping (_ result: Data) -> Void) {
        self.network.makeRequest(url: endpoint, completionHandler: {result in
            completionHandler(result)
        })
    }
}
