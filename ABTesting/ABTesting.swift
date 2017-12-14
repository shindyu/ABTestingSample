//
//  ABTesting.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation

class ABTesting {
    enum Experiment: String {
        case test
    }

    class func getBucketId(fromExp experiment: Experiment) -> String {
        return getBucketId(from: experiment.rawValue)
    }

    class func getBucketId(from str: String) -> String {
        if DataStoreForTesting.isTesting {
            return DataStoreForTesting.buckets[str] ?? ""
        } else {
            // do return bucketId from Api
            return "control"
        }
    }
}
