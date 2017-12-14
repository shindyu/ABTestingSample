//
//  DataStoreForTesting.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation

struct DataStoreForTesting {
    static var buckets: [String: String] = [:]
    static var wasMethodSwizzling = false
    static var isTesting = false
}
