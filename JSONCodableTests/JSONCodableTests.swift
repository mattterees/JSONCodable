//
//  JSONCodableTests.swift
//  JSONCodableTests
//
//  Created by Matthew Rees on 28/01/2019.
//  Copyright © 2019 Matt Rees. All rights reserved.
//

import XCTest
@testable import JSONCodable

class JSONCodableTests: XCTestCase {
    var data: Data?
    let basicStruct = BasicStruct(id: 45, name: "Test Name")
    var jsonData: Data?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let path = Bundle(for: type(of: self)).path(forResource: "ExampleJSON", ofType: "json") else {
            return
        }
        do {
            data = try Data.init(contentsOf: URL(fileURLWithPath: path))
            let jsonEncoder = JSONEncoder()
            jsonData = try jsonEncoder.encode(basicStruct)

        } catch {}
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessfulDecode() {
        let decodedStruct: BasicStruct? = BasicStruct.decodeObject(withData: data)
        XCTAssertEqual(basicStruct, decodedStruct)
    }

    func testErrorDecode() {
        let newStruct = BasicStruct(id: 48, name: "Another Test Name")
        let decodedStruct: BasicStruct? = BasicStruct.decodeObject(withData: data)
        XCTAssertNotEqual(newStruct, decodedStruct)
    }

    func testSuccessfulEncode() {
        let newStruct = BasicStruct(id: 45, name: "Test Name")
        let structData = BasicStruct.encodeObject(newStruct)
        XCTAssertEqual(structData, jsonData)
    }

    func testErrorEncode() {
        let newStruct = BasicStruct(id: 54, name: "Another Name")
        let structData = BasicStruct.encodeObject(newStruct)
        XCTAssertNotEqual(structData, jsonData)
    }

}
