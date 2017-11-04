//
//  FriendListController.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

// ControllerはUseCaseへの参照を持ち、UseCaseの機能を呼び出す。
// UseCaseは複数になることもある。
//
// 今回は特に何も無いが、データ形式を変換してから渡すならばここに書く。

struct FriendListController {
    let useCase: FriendListUseCaseInput
    
    init(useCase: FriendListUseCaseInput) {
        self.useCase = useCase
    }
    
    func loadFriendList() {
        useCase.load()
    }
}
