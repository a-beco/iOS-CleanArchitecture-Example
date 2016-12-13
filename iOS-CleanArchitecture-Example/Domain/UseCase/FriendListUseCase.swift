//
//  FriendListUseCase.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

protocol FriendListUseCaseInput: class {
    func load()
}

protocol FriendListUseCaseInputDelegate: class {
    func useCase(_ useCase: FriendListUseCase, didLoadFriendList friendList: [UserEntity])
}

// データ取得のためDataに求めるインタフェース
protocol FriendListUseCaseDataInput: class {
    weak var delegate: FriendListUseCaseDataInputDelegate? { get set }
    func load()
}

// 依存方向をGateway->UseCaseにするためここに書く必要がある。
// UseCaseはGatewayの存在を一切知らないようにする。
protocol FriendListUseCaseDataInputDelegate: class {
    func dataInput(_ dataInput: FriendListUseCaseDataInput, didLoadFriendList friendList: [UserEntity])
}

// フレンド一覧を取得するUseCase。
// ユーザプロフィールやメッセージの送信先の選択などなど、複数画面から使いまわす可能性がある。
final class FriendListUseCase: FriendListUseCaseInput {

    weak var delegate: FriendListUseCaseInputDelegate?

    let input: FriendListUseCaseDataInput
    
    init(input: FriendListUseCaseDataInput) {
        self.input = input
    }
    
    func load() {
        input.load()
    }
}

// Gatewayからデータ取得した結果を受け取る。
extension FriendListUseCase: FriendListUseCaseDataInputDelegate {
    func dataInput(_ dataInput: FriendListUseCaseDataInput, didLoadFriendList friendList: [UserEntity]) {
        delegate?.useCase(self, didLoadFriendList: friendList)
    }
}
