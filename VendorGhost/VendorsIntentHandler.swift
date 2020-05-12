//
//  VendorsIntentHandler.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 12/05/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import Combine

class VendorsIntentHandler : NSObject, VendorsIntentHandling {
    private var disposables = Set<AnyCancellable>()
    
    func handle(intent: VendorsIntent, completion: @escaping (VendorsIntentResponse) -> Void) {
        let interactor = VendorInteractor(network: Network(network: DefaultHTTPClient()))
        
        interactor.getVendors()
            .tryMap { (vendors) in
                vendors.filter { (vendor) in
                    vendor.displayStatus == true && vendor.dropStatus == "2"
                }.map { vendor in
                    vendor.name
                }
        }.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }, receiveValue: { vendors in
            completion(VendorsIntentResponse.success(vendors: vendors))
        }).store(in: &self.disposables)
    }
}
