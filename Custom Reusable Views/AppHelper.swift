//
//  AppHelper.swift
//  Custom Reusable Views
//
//  Created by ITADMIN on 3/19/18.
//  Copyright © 2018 ITADMIN. All rights reserved.
//

import Foundation

func DLog<T>(_ object: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        let fileString = file as NSString
        let fileLastPathComponent = fileString.lastPathComponent as NSString
        let filename = fileLastPathComponent.deletingPathExtension
        print("\(filename).\(function)[\(line)]: \(object)\n", terminator: "")
    #endif
}
