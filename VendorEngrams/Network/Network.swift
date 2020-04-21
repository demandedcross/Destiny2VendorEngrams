//
//  Network.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import Combine

class Network {
    
    var network : SomeNetworkProtocol
    
    let endpoint = "https://api.vendorengrams.xyz/getVendorDrops"
    
    init(network: SomeNetworkProtocol) {
        self.network = network
    }
    
    func getVendors() -> AnyPublisher<Data, VendorError> {
        return self.network.makeRequest(url: endpoint)
    }
    
    func getVendors(completionHandler: @escaping (_ result: Data) -> Void) {
        self.network.makeRequest(url: endpoint, completionHandler: {result in
            completionHandler(result)
        })
    }
}
