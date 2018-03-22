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
    override func setUp() {
        super.setUp()
        ABTesting.setUp()
    }

    override func tearDown() {
        ABTesting.tearDown()
        super.tearDown()
    }

    func test_targetMethod() {
        let vc = ViewController()

        XCTAssertFalse(vc.targetMethod())
    }

    func test_targetMethod_set_bucket() {
        ABTesting.setUp(ABTesting.BucketSet(experimentId: ABTesting.Test1.experimentId, bucketId: ABTesting.Test1.bucket1.rawValue))

        let vc = ViewController()

        XCTAssertTrue(vc.targetMethod())
    }

    func test_viewDidLoad_set_bucket() {
        ABTesting.setUp(ABTesting.BucketSet(experimentId: ABTesting.Test1.experimentId, bucketId: ABTesting.Test1.bucket1.rawValue))

        let vc = ViewController()
        vc.viewDidLoad()

        XCTAssertEqual(vc.view.backgroundColor, .red)
    }

    func test_Test3Bucket_none() {
        let vc = ViewController()
        vc.viewDidLoad()

        XCTAssertEqual(vc.test3, ABTesting.Test3.none.rawValue)
    }

    func test_Test3Bucket_bucketA() {
        ABTesting.setUp(ABTesting.BucketSet(experimentId: ABTesting.Test3.experimentId, bucketId: ABTesting.Test3.bucketA.rawValue))

        let vc = ViewController()
        vc.viewDidLoad()

        XCTAssertEqual(vc.test3, ABTesting.Test3.bucketA.rawValue)
    }

    func test_Test3Bucket_bucketB() {
        ABTesting.setUp(ABTesting.BucketSet(experimentId: ABTesting.Test3.experimentId, bucketId: ABTesting.Test3.bucketB.rawValue))

        let vc = ViewController()
        vc.viewDidLoad()

        XCTAssertEqual(vc.test3, ABTesting.Test3.bucketB.rawValue)
    }
}
