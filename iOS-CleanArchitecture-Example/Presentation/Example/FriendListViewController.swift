//
//  FriendListViewController.swift
//  iOS-CleanArchitecture-Example
//
//  Created by Kohei Abe on 2016/12/13.
//  Copyright © 2016年 Kohei Abe. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController, FriendListPresenterDelegate {

    private let tableCellId = "friend cell id"
    
    private var controller: FriendListController?
    private var presenter: FriendListPresenter?
    
    private var friendList: [UserViewData] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        constructDependency()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        constructDependency()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableCellId)
        
        // データをロード
        controller?.loadFriendList()
    }
    
    private func constructDependency() {

        // 依存性の構築。DIコンテナを使うと外に出せる。

        let repository = FriendListRepository()
        let gateway = FriendListGateway(input: repository)
        let useCase = FriendListUseCase(input: gateway)
        
        presenter = FriendListPresenter()
        controller = FriendListController(useCase: useCase)
        
        repository.delegate = gateway
        gateway.delegate = useCase
        useCase.delegate = presenter
        presenter?.delegate = self
    }
    
    // MARK: - FriendListPresenterDelegate
    
    func presenter(_ presenter: FriendListPresenter, didLoadFriendList friendList: [UserViewData]) {
        // ロードしたデータを受け取って表示
        self.friendList = friendList
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath)
        cell.textLabel?.text = friendList[indexPath.row].name
        return cell
    }
}
