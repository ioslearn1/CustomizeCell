//
//  TeamViewController.swift
//  CustomizeCell
//
//  Created by Cesar Perez Catalan on 08/12/22.
//

import Foundation
import UIKit
import Alamofire

class TeamViewController: UIViewController {
    
    var tableView = UITableView()
    var dataTable:[FIFAModel]
    
    init(team:[FIFAModel]) {
        self.dataTable = team
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TeamCustomCell.self, forCellReuseIdentifier: TeamCustomCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
        if let titleStr = dataTable[0].country{
            title = titleStr
        }
    }
}

extension TeamViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCustomCell.identifier, for: indexPath) as? TeamCustomCell else { return UITableViewCell() }
        
        var name = dataTable[indexPath.row].name ?? "NONE"
        var position = dataTable[indexPath.row].position ?? "NONE"
        var playerImg = dataTable[indexPath.row].playerImg ?? "NONE"
        cell.configure(name: name,position: position,playerImg: playerImg )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = PlayerViewController(playerId: dataTable[indexPath.row].playerId ?? "NONE", name: dataTable[indexPath.row].name ?? "NONE", position: dataTable[indexPath.row].position ?? "NONE", playerImg: dataTable[indexPath.row].playerImg ?? "NONE")
        navigationController?.pushViewController(player, animated: true)
    }
}
