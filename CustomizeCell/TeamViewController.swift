//
//  TeamViewController.swift
//  CustomizeCell
//
//  Created by Rosendo Vazquez on 08/12/22.
//

import Foundation
import UIKit

class TeamViewController: UIViewController {
    
    var team:String?
    let datasource = ["Player"]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    init(team:String) {
        self.team = team
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "TeamName"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TeamCustomCell.self, forCellReuseIdentifier: TeamCustomCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    
    }
}

extension TeamViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCustomCell.identifier, for: indexPath) as? TeamCustomCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = PlayerViewController(playerId: datasource[indexPath.row])
        navigationController?.pushViewController(player, animated: true)
    }
    
}
