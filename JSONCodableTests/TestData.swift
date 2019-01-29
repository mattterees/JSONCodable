//
//  TestData.swift
//  JSONCodableTests
//
//  Created by Matthew Rees on 28/01/2019.
//  Copyright © 2019 Matt Rees. All rights reserved.
//

import Foundation

@testable import JSONCodable

struct BasicStruct: JSONCodable, Equatable {
    var id: Int
    var name: String
}
