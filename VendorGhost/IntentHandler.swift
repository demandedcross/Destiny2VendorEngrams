//
//  IntentHandler.swift
//  VendorGhost
//
//  Created by Ryan Johnstone on 12/05/2020.
//  Copyright © 2020 Ryan Johnstone. All rights reserved.
//

import Intents


class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        guard intent is VendorsIntent else {
            fatalError("Unhandled Intent error: \(intent)")
        }
        
        return VendorsIntentHandler()
    }
    
 
}
