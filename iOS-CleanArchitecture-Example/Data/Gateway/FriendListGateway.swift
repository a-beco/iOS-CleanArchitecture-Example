//
//  FriendListGateway.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

protocol FriendListGatewayInput: class {
    weak var delegate: FriendListGatewayInputDelegate? { get set }
    func load()
}

// 依存方向をRepository->Gatewayにするためここに書く必要がある。
// GatewayはRepositoryの存在を一切知らないようにする。
protocol FriendListGatewayInputDelegate: class {
    func gateway(_ gateway: FriendListGatewayInput, didLoadFriendList friendList: FriendListData)
}

// Gatewayは取得したデータをDomainに都合の良いデータ形式に変換して渡す。
// 依存の方向を内向きにするため、変換先のデータ形式はDomainで定義される。

final class FriendListGateway: FriendListUseCaseDataInput {
    weak var delegate: FriendListUseCaseDataInputDelegate?
    let input: FriendListGatewayInput
    
    init(input: FriendListGatewayInput) {
        self.input = input
    }
    
    func load() {
        input.load()
    }
}

// Repositoryからデータ取得した結果を受け取る。
extension FriendListGateway: FriendListGatewayInputDelegate {
    func gateway(_ gateway: FriendListGatewayInput, didLoadFriendList friendList: FriendListData) {
        // FriendListData -> [UserEntity] の変換
        delegate?.dataInput(self, didLoadFriendList: friendList.users.map {
            UserEntity(id: $0.id, name: UserName(first: $0.name.first, last: $0.name.last))
        })
    }
}
