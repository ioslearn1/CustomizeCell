//
//  ViewController.swift
//  CustomizeCell
//
//  Created by Cesar Perez Catalan on 01/12/22.
//

import UIKit

class ViewController: UIViewController {

    let color1 = UIColor(red: 0.59, green: 0.04, blue: 0.20, alpha: 1.00)
    let color2 = UIColor(red: 0.14, green: 0.00, blue: 0.05, alpha: 1.00)
    
    lazy var logo: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "logo")
        return img
    }()
    
    lazy var lbl1: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "FIFA WORLD"
        lbl.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        return lbl
    }()
    
    lazy var lbl2: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "CUP"
        lbl.font = UIFont.systemFont(ofSize: 64, weight: .bold)
        return lbl
    }()
    
    lazy var btnEntry: UIButton = {
        let btn = UIButton()
        btn.layer.backgroundColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 24
        btn.setTitle("Acceder", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        btn.setTitleColor(UIColor(red: 0.59, green: 0.04, blue: 0.20, alpha: 1.00), for: .normal)
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground(color1: color1, color2: color2)
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        view.addSubview(lbl1)
        lbl1.translatesAutoresizingMaskIntoConstraints = false
        lbl1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 130).isActive = true
        lbl1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(lbl2)
        lbl2.translatesAutoresizingMaskIntoConstraints = false
        lbl2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 180).isActive = true
        lbl2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(btnEntry)
        btnEntry.translatesAutoresizingMaskIntoConstraints = false
        btnEntry.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250).isActive = true
        btnEntry.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnEntry.widthAnchor.constraint(equalToConstant: 250).isActive = true
        btnEntry.addTarget(self, action: #selector(goHome), for: .touchUpInside)

    }
    
    @objc func goHome()  {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setGradientBackground(color1:UIColor, color2:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}

