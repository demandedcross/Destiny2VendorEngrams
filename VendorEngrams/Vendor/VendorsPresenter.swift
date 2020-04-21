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
    
//    func displayVendors() -> AnyPublisher<[Vendor], Never> {
//
//    }
}
