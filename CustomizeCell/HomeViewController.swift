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
    var dataTeams : [String] = []
    var dataPlayers = [FIFAModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "National Teams"
        configureNavigation()
        view.backgroundColor = .white
        fetchData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    
    func configureNavigation()  {
        
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.59, green: 0.04, blue: 0.20, alpha: 1.00), NSAttributedString.Key.font:UIFont(name: "Verdana-bold", size: 20)]
        
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0.59, green: 0.04, blue: 0.20, alpha: 1.00)
    }
    
    func fetchData() {
        AF.request("https://world-cup.dvrosenvb.com/").response{ [weak self] response in
            
            if let data = response.data {
                let decoder = JSONDecoder()
                let dataFetched = try! decoder.decode([FIFAModel].self, from: data)
                self?.dataTable = dataFetched
                self?.notRepeated(dataTable: dataFetched)
//                self?.tableView.reloadData()
            }
        }
    }
    
    func notRepeated(dataTable: [FIFAModel]){
        var lastCountry = ""
        var currentCountry = ""
        dataTable.forEach { item in
            if let itemTemp = item.country {
                currentCountry = itemTemp
                if currentCountry != lastCountry {
                    lastCountry = currentCountry
                    dataTeams.append(currentCountry)
                }
            }
            
        }
        tableView.reloadData()
    }
    
    
    func filterPlayer(dataTable: [FIFAModel], country:String){
  
        dataTable.forEach { item in
            if let currentItem = item.country {
                if currentItem == country{
                    dataPlayers.append(item)
                }
            }
        }
    }
        
}

extension HomeViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        
        var country = dataTeams[indexPath.row]
        var countryLogo = dataTable[indexPath.row].countryLogo ?? "NONE"
        cell.configure(country: country,countryLogo: countryLogo )

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filterPlayer(dataTable: dataTable,country: dataTeams[indexPath.row])
        let team = TeamViewController(team: dataPlayers)
        navigationController?.pushViewController(team, animated: true)
        dataPlayers = []
    }
}
