//
//  FriendListPresenter.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

// PresenterはUseCaseの処理結果を受け取る。
// ビューで表示しやすいようにデータを変換してから、ViewControllerに渡す。

protocol FriendListPresenterDelegate: class {
    func presenter(_ presenter: FriendListPresenter, didLoadFriendList friendList: [UserViewData])
}

final class FriendListPresenter: FriendListUseCaseInputDelegate {
    weak var delegate: FriendListPresenterDelegate?
    
    func useCase(_ useCase: FriendListUseCase, didLoadFriendList friendList: [UserEntity]) {
        // UserEntity -> UserViewData に変換する。
        // 表示するのはフルネームなので、ここで苗字と名前を結合する。
        let users = friendList.map { UserViewData(id: $0.id, name: $0.name.full()) }
        delegate?.presenter(self, didLoadFriendList: users)
    }
}
