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
    
    func test_targetMethod() {
        let vc = ViewController()

        XCTAssertFalse(vc.targetMethod())
    }

    func test_targetMethod_set_bucket() {
        ABTesting.setupForTesting()
        ABTesting.setBucketIdForTesting(with: "bucket", to: .test)

        let vc = ViewController()

        XCTAssertTrue(vc.targetMethod())
    }

    func test_viewDidLoad_set_bucket() {
        ABTesting.setupForTesting()
        ABTesting.setBucketIdForTesting(with: "bucket", to: .test)

        let vc = ViewController()
        vc.viewDidLoad()

        XCTAssertEqual(vc.view.backgroundColor, .red)
    }
}
