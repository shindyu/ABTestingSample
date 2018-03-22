//
//  ViewController.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var test3: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = targetMethod() ? .red : .blue

        test3Method()

        printValues()


    }

    func test3Method() {
        test3 = ABTesting.Test3.myBucket.rawValue
    }

    func printValues() {
        print("Test1.myBucket = \(ABTesting.Test1.myBucket)")
        print("Test1.myBucket.rawValue = \(ABTesting.Test1.myBucket.rawValue)")
        print("Test1.experimentId = \(ABTesting.Test1.experimentId)")
        print("\n")

        print("Test2.myBucket = \(ABTesting.Test2.myBucket)")
        print("Test2.myBucket.rawValue = \(ABTesting.Test2.myBucket.rawValue)")
        print("Test2.experimentId = \(ABTesting.Test2.experimentId)")
        print("\n")

        print("Test3.myBucket = \(ABTesting.Test3.myBucket)")
        print("Test3.myBucket.rawValue = \(ABTesting.Test3.myBucket.rawValue)")
        print("Test3.experimentId = \(ABTesting.Test3.experimentId)")
        print("\n")

        // objc側からの呼び出し用メソッドを都度用意
        print("ObjcClass.getBucketIdStringTest3 = \(ObjcClass().getBucketIdStringTest3())")
        //        print(ABTesting.getBucketIdTest3()) // Swiftからは見えないようにしておくとbetter

        //        // objc側から直接experimentId指定しないようにする方が安全
        //        print("ObjcClass.getBucketIdString = \(ObjcClass().getBucketIdString())")
    }

    func targetMethod() -> Bool {
        switch ABTesting.Test1.myBucket {
        case .bucket1:
            return true
        default:
            return false
        }
    }
}
