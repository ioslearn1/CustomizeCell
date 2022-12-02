//
//  ViewController.swift
//  CustomizeCell
//
//  Created by Rosendo Vazquez on 01/12/22.
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
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground(color1: color1, color2: color2)
        super.viewWillAppear(animated)
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
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            //eliminar la sig linea
            self.goHome()
        }
        
    }
    
    func goHome()  {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
    func setGradientBackground(color1:UIColor, color2:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}

