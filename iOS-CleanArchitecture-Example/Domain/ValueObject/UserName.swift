//
//  UserName.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

// Domainでビジネスロジックを処理するクラス。
// 通常IDのような識別子を持たず、値とそれに対する処理を持つ。

struct UserName {
    let first: String
    let last: String
    
    func full() -> String {
        return "\(first) \(last)"
    }
}
