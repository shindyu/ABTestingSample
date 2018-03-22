//
//  ABTestingExtension.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation
@testable import ABTesting

extension ABTesting {
    struct BucketSet {
        let experimentId: String
        let bucketId: String
    }

    class func setUp(_ sets: BucketSet...) {
        DataStoreForTesting.buckets = [:]

        for set in sets {
            DataStoreForTesting.buckets.updateValue(set.bucketId, forKey: set.experimentId)
        }
    }

    class func tearDown() {
        DataStoreForTesting.buckets = [:]
    }
}

