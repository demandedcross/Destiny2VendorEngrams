//
//  VendorInteractorProtocol.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 21/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Combine

protocol VendorInteractorProtocol {
    func getVendors() -> AnyPublisher<[Vendor], Error>
}
