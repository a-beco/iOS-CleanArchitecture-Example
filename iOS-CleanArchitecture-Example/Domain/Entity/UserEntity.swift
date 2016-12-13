//
//  UserEntity.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

// Domainでビジネスロジックを処理するクラス。
// 今回は単にデータを持つのみ。
//
// Entityはidで同一性を確認するので、
// ちゃんとEntityを書くなら==のオーバーロードとか必要かもしれない。

struct UserEntity {
    let id: String
    let name: UserName
}
