//
//  HomeViewController.swift
//  CustomizeCell
//
//  Created by Rosendo Vazquez on 01/12/22.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    var tableView = UITableView()
    var dataTable = [FIFAModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "National Teams"
        view.backgroundColor = .white
        fetchData()
        notRepeated()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    
    func fetchData() {
        AF.request("https://world-cup.dvrosenvb.com/").response{ [weak self] response in
            
            if let data = response.data {
                let decoder = JSONDecoder()
                let dataFetched = try! decoder.decode([FIFAModel].self, from: data)
                self?.dataTable = dataFetched
                self?.tableView.reloadData()
            }
        }
    }
    
    func notRepeated(){
        
    }
        
}

extension HomeViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        
        var country = dataTable[indexPath.row].country ?? "NONE"
        var countryLogo = dataTable[indexPath.row].countryLogo ?? "NONE"
        cell.configure(country: country,countryLogo: countryLogo )

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = TeamViewController(team: dataTable[indexPath.row].country ?? "NONE")
        navigationController?.pushViewController(team, animated: true)
    }
    
}
