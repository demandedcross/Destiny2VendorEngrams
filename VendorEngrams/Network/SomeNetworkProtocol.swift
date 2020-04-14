//
//  SomeNetworkProtocol.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 07/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation

public protocol SomeNetworkProtocol {
    func makeRequest(url: String, completionHandler: @escaping (_ result: Data) -> Void)
}
