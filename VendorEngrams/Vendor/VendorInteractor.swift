//
//  VendorInteractor.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import Combine

class VendorInteractor : VendorInteractorProtocol {
    var network : Network
    let decoder = JSONDecoder()
    
    init(network: Network) {
        self.network = network
    }
    
    func getVendors() -> AnyPublisher<[Vendor], Error> {
        return network.getVendors()
            .tryMap { data in
                try self.decoder.decode([Vendor].self, from: data)
        }.eraseToAnyPublisher()
    }
}
