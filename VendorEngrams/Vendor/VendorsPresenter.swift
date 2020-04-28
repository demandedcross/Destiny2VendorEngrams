//
//  VendorsPresenter.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 21/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation
import Combine

class VendorsPresenter {
    let vendorInteractor : VendorInteractorProtocol
    private var disposables = Set<AnyCancellable>()

    init(vendorInteractor: VendorInteractorProtocol) {
        self.vendorInteractor = vendorInteractor
    }
    
    func displayVendors() -> AnyPublisher<[VendorVM], Error> {
        return vendorInteractor.getVendors()
            .tryMap { (vendors) in
                vendors.filter { (vendor) in
                    vendor.displayStatus
                }.map { vendor in
                    return  VendorVM(name: self.nameTranslation(name: vendor.name), dropping: vendor.dropStatus)
                }
        }.eraseToAnyPublisher()
    }
    
    private func nameTranslation(name: String) -> String {
        switch name {
        case "fanboy":
            return "Vance"
        default:
            return name.capitalizingFirstLetter()
        }
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
