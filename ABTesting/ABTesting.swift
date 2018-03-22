//
//  ABTesting.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import Foundation

// 独自設定の場合はLocalExperimentable準拠にした方がmyBucketの実装を強制できるのでちょっと安全？
// まぁ過剰かも。
protocol LocalExperimentable {
    init(bucketId: String)
    static var experimentId: String { get }
    static var myBucket: Self { get }
}

protocol Experimentable {
    init(bucketId: String)
    static var experimentId: String { get }
    static var myBucket: Self { get }
}

extension Experimentable {
    static var myBucket: Self {
        // getBucketIdはここに隠蔽する
        let bucketId: String
        if isTesting {
            bucketId = DataStoreForTesting.buckets[experimentId] ?? ""
        } else {
            // do return bucketId from Api
            bucketId = "control"
        }
        return self.init(bucketId: bucketId)
    }
}

@objcMembers
class ABTesting: NSObject {
    enum Test1: String, Experimentable {
        case control
        case bucket1
        case none = ""

        init(bucketId: String) {
            switch bucketId {
            case "control": self = .control
            case "bucket1": self = .bucket1
            default: self = .none
            }
        }

        static var experimentId: String {
            return "Test1-experimentId"
        }
    }

    enum Test2: String, Experimentable {
        case control
        case bucket2
        case none = ""

        init(bucketId: String) {
            switch bucketId {
            case "control": self = .control
            case "bucket2": self = .bucket2
            default: self = .none
            }
        }

        static var experimentId: String {
            return "Test2-experimentId"
        }
    }

    enum Test3: String, LocalExperimentable {
        case control
        case bucketA
        case bucketB
        case none = ""

        init(bucketId: String) {
            switch bucketId {
            case "control": self = .control
            case "bucketA": self = .bucketA
            case Test3.bucketB.rawValue: self = .bucketB // こういう書き方は過剰かな・・
            default: self = .none
            }
        }

        static var experimentId: String {
            return "Test3-experimentId"
        }

        // 独自設定の場合はmyBucketをImpl
        static var myBucket: ABTesting.Test3 {
            let bucketId: String
            if isTesting {
                bucketId = DataStoreForTesting.buckets[experimentId] ?? ""
            } else {
                // ここでバケットを独自設定 ex) ランダムとか
                bucketId = Test3.bucketA.rawValue
            }
            return self.init(bucketId: bucketId)
        }
    }

    // objcから使うときは専用のメソッドを用意するのが安全？
    @available(swift, obsoleted: 3.0)
    class func getBucketIdTest3() -> String {
        return Test3.myBucket.rawValue
    }

    class func request() {
        // Experimentable準拠のenumのexperimentIdを上手く取れないか？
        let array: [String] = [
            Test1.experimentId,
            Test2.experimentId
        ]
        print(array)
    }
}
