//
//  ViewControllerTests.swift
//  ABTestingTests
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation
import XCTest
@testable import ABTesting

class ViewControllerTests: XCTestCase {
    
    func test_targetMethod_bucket() {
        DataStoreForTesting.bucket = "bucket"

        let vc = ViewController()

        XCTAssertTrue(vc.targetMethod())
    }

    func test_targetMethod_control() {
        DataStoreForTesting.bucket = "control"

        let vc = ViewController()

        XCTAssertFalse(vc.targetMethod())
    }
}
