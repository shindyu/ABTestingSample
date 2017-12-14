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

    // "@objc dynamic" must be given in order to replace with tests
    @objc dynamic class func getBucketId(from str: String) -> String {
        // do return bucketId from Api
        return "control"
    }
}
