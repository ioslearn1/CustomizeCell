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
        return img
    }()
    
    var namePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.02, green: 0.58, blue: 0.40, alpha: 1.00)
        lbl.text = "namePlayer"
        lbl.font = UIFont.systemFont(ofSize: 54, weight: .bold)
        return lbl
    }()
    
    var valuePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "valuePlayer"
        lbl.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return lbl
    }()
    
    var positionPlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "positionPlayer"
        lbl.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return lbl
    }()
    
    var rangePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "rangePlayer"
        lbl.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return lbl
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
        view.backgroundColor = UIColor(red: 0.93, green: 0.92, blue: 0.88, alpha: 1.00)
        
        view.addSubview(avatarPlayer)
        avatarPlayer.translatesAutoresizingMaskIntoConstraints = false
        avatarPlayer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        avatarPlayer.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        avatarPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        avatarPlayer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300).isActive = true
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
       
        
        
        if let playerId = playerId {
            print(":::: el jugador que se debe consultar es: \(playerId)")
        }
    }
}
