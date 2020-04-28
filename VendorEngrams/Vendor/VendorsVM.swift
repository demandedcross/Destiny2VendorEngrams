//
//  VendorsVM.swift
//  VendorEngrams
//
//  Created by Ryan Johnstone on 28/04/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Foundation

final class VendorsVM : ObservableObject, Identifiable {
    @Published var vendors : [VendorVM] = []
}

struct VendorVM : Identifiable {
    var id = UUID()
    
    let name: String
    let dropping: String
}
