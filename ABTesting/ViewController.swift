//
//  ViewController.swift
//  ABTesting
//
//  Created by shindyu on 2017/12/14.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func targetMethod() -> Bool {
        switch ABTesting.getBucketId() {
        case "bucket":
            return true
        default:
            return false
        }
    }
}
