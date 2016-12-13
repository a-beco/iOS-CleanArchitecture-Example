//
//  FriendListDataType.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

// Dataでのみ使うデータ構造。
// DBの保存形式や通信先の仕様などによって制限される可能性がある。

struct UserData {
    struct Name {
        let first: String
        let last: String
    }
    
    let id: String
    let name: Name
}

struct FriendListData {
    let users: [UserData]
}
