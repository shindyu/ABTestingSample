//
//  ABTesting.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation

class ABTesting {
    class func getBucketId() -> String {
        if isTesting {
            return DataStoreForTesting.bucket
        } else {
            return "control"
        }
    }
}

struct DataStoreForTesting {
    static var bucket: String = ""
}

var isTesting: Bool {
    return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
}
