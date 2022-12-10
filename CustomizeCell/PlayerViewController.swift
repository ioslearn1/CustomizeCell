//
//  PlayerViewController.swift
//  CustomizeCell
//
//  Created by Cesar  Perez Catalan on 10/12/22.
//

import Foundation
import UIKit

class PlayerViewController: UIViewController {
    
    var playerId:String?
    
    lazy var avatarPlayer: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "player")
        img.backgroundColor = .white
        return img
    }()
    
    lazy var namePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.02, green: 0.58, blue: 0.40, alpha: 1.00)
        lbl.text = "namePlayer"
        lbl.font = UIFont.systemFont(ofSize: 54, weight: .bold)
        return lbl
    }()
    
    lazy var valuePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "valuePlayer"
        lbl.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return lbl
    }()
    
    lazy var positionPlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "positionPlayer"
        lbl.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return lbl
    }()
    
    lazy var rangePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "rangePlayer"
        lbl.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return lbl
    }()
    
    lazy var progressBar: UIProgressView = {
        let pv = UIProgressView()
        pv.progressViewStyle = .default
        pv.tintColor = Utils.foregroundProgress
        pv.progress = 0.5
        pv.backgroundColor = Utils.backgroundProgress
        pv.layer.cornerRadius = 4
        return pv
    }()
    
    
    init(playerId:String) {
        self.playerId = playerId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Utils.backgroundColorPlayer
        title = "Player"
        setup()
        progressBar.subviews.forEach { view in
            view.layer.cornerRadius = 4
        }
        
        let player = PlayerModel(idPlayer: 1, namePlayer: "Guillermo Ochoa", valuePlayer: 100000.2, positionPlayer: "Goalkepper", rangePlayer: "28", imgPlayer: "")
        configureView(player: player )//mover a la llamada de la API
    }
    
    func setup() {
        view.addSubview(avatarPlayer)
        avatarPlayer.translatesAutoresizingMaskIntoConstraints = false
        avatarPlayer.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        avatarPlayer.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        avatarPlayer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height/2.0).isActive = true
        avatarPlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarPlayer.layer.cornerRadius = CGFloat(view.frame.height/2.0)
        
        view.addSubview(namePlayer)
        namePlayer.translatesAutoresizingMaskIntoConstraints = false
        namePlayer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        namePlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(valuePlayer)
        valuePlayer.translatesAutoresizingMaskIntoConstraints = false
        valuePlayer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        valuePlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(positionPlayer)
        positionPlayer.translatesAutoresizingMaskIntoConstraints = false
        positionPlayer.centerYAnchor.constraint(equalTo: valuePlayer.centerYAnchor, constant: 40).isActive = true
        positionPlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(rangePlayer)
        rangePlayer.translatesAutoresizingMaskIntoConstraints = false
        rangePlayer.centerYAnchor.constraint(equalTo: positionPlayer.centerYAnchor, constant: 40).isActive = true
        rangePlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBar.topAnchor.constraint(equalTo: rangePlayer.bottomAnchor, constant: 10).isActive = true
        progressBar.widthAnchor.constraint(equalToConstant: 200).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    func configureView(player:PlayerModel) {
        title = player.namePlayer
        namePlayer.text = ""
        valuePlayer.text = "$ \(player.valuePlayer ?? 0.0)"
        positionPlayer.text = player.positionPlayer
        rangePlayer.text = player.rangePlayer
        
        if let progress = Float(player.rangePlayer ?? "0.0") {
            progressBar.progress = (progress / 100)
        }
        
    }
    
    
}
