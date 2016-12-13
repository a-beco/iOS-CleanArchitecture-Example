//
//  FriendListRepository.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import Foundation

// Repositoryはデータを取得して返す。

final class FriendListRepository: FriendListGatewayInput {
    weak var delegate: FriendListGatewayInputDelegate?

    func load() {

        // mock data
        let users = [UserData(id: "dummy1", name: UserData.Name(first: "Jed", last: "Bronstein")),
                     UserData(id: "dummy2", name: UserData.Name(first: "Carma", last: "Bohrer")),
                     UserData(id: "dummy3", name: UserData.Name(first: "Wallace", last: "Girton"))]
        let friendList = FriendListData(users: users)
        
        delegate?.gateway(self, didLoadFriendList: friendList)
    }
}
