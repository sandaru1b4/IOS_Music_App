//
//  TestingVCTableViewController.swift
//  Canciones
//
//  Created by Achitha Sandaruwan on 2022-07-16.
//

import UIKit

class TestingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var users: UserProfile?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        fetch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    
    func fetch() {
        URLSession.shared.request(url: APIsHelper.Constants.userUrl,
                                  expecting: UserProfile.self) { result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                    self.table.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users?.name
        return cell
    }

}
