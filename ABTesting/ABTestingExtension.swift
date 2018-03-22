//
//  ABTestingExtension.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation

extension ABTesting {
    class func setBucketIdForTesting(with bucketId: String, to e: Experiment) {
        DataStoreForTesting.buckets.updateValue(bucketId, forKey: e.rawValue)
    }

    class func setupForTesting() {
        DataStoreForTesting.buckets = [:]
    }
}

