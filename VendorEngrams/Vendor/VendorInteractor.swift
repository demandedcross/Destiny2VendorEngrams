//
//  VendorInteractor.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import Combine

class VendorInteractor {
    var network : Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getVendors(completionHandler: @escaping (_ result: AnyPublisher<[Vendor], Never>) -> Void) {
        
        network.getVendors(completionHandler: { result in
            let decoder = JSONDecoder()
            do {
            let vendors = try decoder.decode([Vendor].self, from: result)
                completionHandler(
                          Just(vendors)
                              .eraseToAnyPublisher()
                      )
            }
            catch {}
            
        })
    }
}
