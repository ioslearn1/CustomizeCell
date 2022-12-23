//
//  PlayerViewController.swift
//  CustomizeCell
//
//  Created by Cesar  Perez Catalan on 10/12/22.
//

import Foundation
import UIKit
import Alamofire

class PlayerViewController: UIViewController {
    
    var playerId:String?
    var name:String?
    var position:String?
    var playerImg:String?
    var randomDouble:Double?
    var average:Int?
    var randomFloatATK:Float?
    var randomFloatDEF:Float?
    var randomFloatRitmo:Float?
    var randomFloatphy:Float?
    
    lazy var avatarPlayer: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.backgroundColor = .white
        return img
    }()
    
    lazy var namePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.02, green: 0.58, blue: 0.40, alpha: 1.00)
        lbl.text = name
        lbl.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        return lbl
    }()
    
    lazy var valuePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "$ \(String(format: "%.2f", randomDouble!))"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var lblValue: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Valor: "
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var positionPlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = position
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var lblPosition: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Posición: "
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var rangePlayer: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "\(String(average!))"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var lblRange: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Rango: "
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var lblATK: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Ataque"
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return lbl
    }()
    
    lazy var lblDEF: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Defensa"
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return lbl
    }()
    
    lazy var lblRitmo: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Ritmo"
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return lbl
    }()
    
    lazy var lblPhy: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.text = "Físico"
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return lbl
    }()
    
    lazy var progressBarATK: UIProgressView = {
        let pv = UIProgressView()
        pv.progressViewStyle = .default
        pv.tintColor = Utils.foregroundProgress
        pv.progress = randomFloatATK!
        pv.backgroundColor = Utils.backgroundProgress
        pv.layer.cornerRadius = 4
        return pv
    }()
    
    lazy var progressBarDEF: UIProgressView = {
        let pv = UIProgressView()
        pv.progressViewStyle = .default
        pv.tintColor = Utils.foregroundProgress
        pv.progress = randomFloatDEF!
        pv.backgroundColor = Utils.backgroundProgress
        pv.layer.cornerRadius = 4
        return pv
    }()
    
    lazy var progressBarRitmo: UIProgressView = {
        let pv = UIProgressView()
        pv.progressViewStyle = .default
        pv.tintColor = Utils.foregroundProgress
        pv.progress = randomFloatRitmo!
        pv.backgroundColor = Utils.backgroundProgress
        pv.layer.cornerRadius = 4
        return pv
    }()
    
    lazy var progressBarPhy: UIProgressView = {
        let pv = UIProgressView()
        pv.progressViewStyle = .default
        pv.tintColor = Utils.foregroundProgress
        pv.progress = randomFloatphy!
        pv.backgroundColor = Utils.backgroundProgress
        pv.layer.cornerRadius = 4
        return pv
    }()
    
    init(playerId:String, name:String, position:String, playerImg:String) {
        self.playerId = playerId
        self.name = name
        self.position = position
        self.playerImg = playerImg
        super.init(nibName: nil, bundle: nil)
        
        getImageFromURL(url: playerImg ?? "NONE", avatarPlayer: avatarPlayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Utils.backgroundColorPlayer
        title = name
        configureView()
        setup()
        progressBarATK.subviews.forEach { view in
            view.layer.cornerRadius = 4
        }
        
        progressBarDEF.subviews.forEach { view in
            view.layer.cornerRadius = 4
        }
        
        progressBarRitmo.subviews.forEach { view in
            view.layer.cornerRadius = 4
        }
        
        progressBarPhy.subviews.forEach { view in
            view.layer.cornerRadius = 4
        }
    }
    
    func getImageFromURL(url:String, avatarPlayer: UIImageView){

        AF.request(url).response{ [weak self] response in
            if let data = response.data{
                avatarPlayer.image = UIImage(data: data, scale: 1)
            }
        }
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
        
        view.addSubview(lblValue)
        lblValue.translatesAutoresizingMaskIntoConstraints = false
        lblValue.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        lblValue.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 65).isActive = true
        
        view.addSubview(valuePlayer)
        valuePlayer.translatesAutoresizingMaskIntoConstraints = false
        valuePlayer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        valuePlayer.centerXAnchor.constraint(equalTo: lblValue.trailingAnchor, constant: 70).isActive = true
        
        view.addSubview(lblPosition)
        lblPosition.translatesAutoresizingMaskIntoConstraints = false
        lblPosition.centerYAnchor.constraint(equalTo: lblValue.centerYAnchor, constant: 30).isActive = true
        lblPosition.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(positionPlayer)
        positionPlayer.translatesAutoresizingMaskIntoConstraints = false
        positionPlayer.centerYAnchor.constraint(equalTo: lblPosition.centerYAnchor).isActive = true
        positionPlayer.centerXAnchor.constraint(equalTo: lblPosition.trailingAnchor, constant: 50).isActive = true
        
        view.addSubview(lblRange)
        lblRange.translatesAutoresizingMaskIntoConstraints = false
        lblRange.centerYAnchor.constraint(equalTo: lblPosition.centerYAnchor, constant: 30).isActive = true
        lblRange.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        
        view.addSubview(rangePlayer)
        rangePlayer.translatesAutoresizingMaskIntoConstraints = false
        rangePlayer.centerYAnchor.constraint(equalTo: lblRange.centerYAnchor).isActive = true
        rangePlayer.centerXAnchor.constraint(equalTo: lblRange.trailingAnchor, constant: 25).isActive = true
        
        view.addSubview(lblATK)
        lblATK.translatesAutoresizingMaskIntoConstraints = false
        lblATK.centerYAnchor.constraint(equalTo: lblRange.centerYAnchor, constant: 50).isActive = true
        lblATK.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(progressBarATK)
        progressBarATK.translatesAutoresizingMaskIntoConstraints = false
        progressBarATK.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBarATK.topAnchor.constraint(equalTo: lblATK.bottomAnchor, constant: 5).isActive = true
        progressBarATK.widthAnchor.constraint(equalToConstant: 300).isActive = true
        progressBarATK.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        view.addSubview(lblDEF)
        lblDEF.translatesAutoresizingMaskIntoConstraints = false
        lblDEF.centerYAnchor.constraint(equalTo: lblATK.centerYAnchor, constant: 40).isActive = true
        lblDEF.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(progressBarDEF)
        progressBarDEF.translatesAutoresizingMaskIntoConstraints = false
        progressBarDEF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBarDEF.topAnchor.constraint(equalTo: lblDEF.bottomAnchor, constant: 5).isActive = true
        progressBarDEF.widthAnchor.constraint(equalToConstant: 300).isActive = true
        progressBarDEF.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        view.addSubview(lblRitmo)
        lblRitmo.translatesAutoresizingMaskIntoConstraints = false
        lblRitmo.centerYAnchor.constraint(equalTo: lblDEF.centerYAnchor, constant: 40).isActive = true
        lblRitmo.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(progressBarRitmo)
        progressBarRitmo.translatesAutoresizingMaskIntoConstraints = false
        progressBarRitmo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBarRitmo.topAnchor.constraint(equalTo: lblRitmo.bottomAnchor, constant: 5).isActive = true
        progressBarRitmo.widthAnchor.constraint(equalToConstant: 300).isActive = true
        progressBarRitmo.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        view.addSubview(lblPhy)
        lblPhy.translatesAutoresizingMaskIntoConstraints = false
        lblPhy.centerYAnchor.constraint(equalTo: lblRitmo.centerYAnchor, constant: 40).isActive = true
        lblPhy.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(progressBarPhy)
        progressBarPhy.translatesAutoresizingMaskIntoConstraints = false
        progressBarPhy.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBarPhy.topAnchor.constraint(equalTo: lblPhy.bottomAnchor, constant: 5).isActive = true
        progressBarPhy.widthAnchor.constraint(equalToConstant: 300).isActive = true
        progressBarPhy.heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
    
    func configureView() {
        randomDouble = Double.random(in: 1...1000000)
        randomFloatATK = Float.random(in: 0.0...0.9)
        randomFloatDEF = Float.random(in: 0.0...0.9)
        randomFloatRitmo = Float.random(in: 0.0...0.9)
        randomFloatphy = Float.random(in: 0.0...0.9)
        average = Int.random(in: 70...94)
    }
}
