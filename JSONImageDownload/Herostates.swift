
//
//  Herostates.swift
//  JSONImageDownload
//
//  Created by brn.developers on 6/14/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import Foundation

struct Herostates:Decodable {
    
    let localized_name : String
    let primary_attr : String
    let attack_type :String
    let legs :Int
    let img:String
    
}
