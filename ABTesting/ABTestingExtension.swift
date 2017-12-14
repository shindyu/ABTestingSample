//
//  ABTestingExtension.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation

fileprivate struct DataStoreForTesting {
    static var buckets: [String: String] = [:]
    static var wasMethodSwizzling = false
}

extension ABTesting {
    @objc dynamic class func getBucketIdForTesting(from str: String) -> String {
        return DataStoreForTesting.buckets[str] ?? ""
    }

    class func setBucketIdForTesting(with bucketId: String, to e: Experiment) {
        DataStoreForTesting.buckets.updateValue(bucketId, forKey: e.rawValue)
    }

    class func setupForTesting() {
        DataStoreForTesting.buckets = [:]
        methodSwizzling()
    }

    fileprivate class func methodSwizzling() {
        if !DataStoreForTesting.wasMethodSwizzling {
            DataStoreForTesting.wasMethodSwizzling = true
            let originalMethod = class_getClassMethod(ABTesting.self, #selector(ABTesting.getBucketId(from:)))
            let swizzledMethod = class_getClassMethod(ABTesting.self, #selector(ABTesting.getBucketIdForTesting(from:)))
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
}
