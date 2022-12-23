//
//  TeamCustomCell.swift
//  CustomizeCell
//
//  Created by Cesar  Perez Catalan on 07/12/22.
//
import UIKit
import Alamofire

class TeamCustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    var ImgPlayerText: String?
    
    lazy var viewGeneralContainer: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.clear.cgColor
        return view
    }()
    
    lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00).cgColor
        view.layer.cornerRadius = 14
        return view
    }()

    lazy var avatarPlayer: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.backgroundColor = .red
        img.image = UIImage(named: "playerTable")
        return img
    }()
    
    lazy var imgNext: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(named: "arrow-right")
        return img
    }()
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Helveticaneue-bold", size: 15)
        label.text = "Guillermo Ochoa"
        return label
    }()
    
    lazy var lblPosition: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Helveticaneue", size: 10)
        label.text = "Goalkeeper"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getImageFromURL(url:String, avatarPlayer: UIImageView){

        AF.request(url).response{ [weak self] response in
            if let data = response.data{
                avatarPlayer.image = UIImage(data: data, scale: 1)
            }
        }
    }
    
    func configure(name: String,position: String,playerImg: String ){
        lblName.text = name
        lblPosition.text = position
        ImgPlayerText = playerImg
        
        getImageFromURL(url: ImgPlayerText ?? "NONE", avatarPlayer: avatarPlayer)
    }
    
    func setupCell(){
       
        contentView.addSubview(viewGeneralContainer)
        viewGeneralContainer.translatesAutoresizingMaskIntoConstraints = false
        viewGeneralContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        viewGeneralContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        viewGeneralContainer.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32).isActive = true
        viewGeneralContainer.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        viewGeneralContainer.addSubview(viewContainer)
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.centerXAnchor.constraint(equalTo: viewGeneralContainer.centerXAnchor).isActive = true
        viewContainer.centerYAnchor.constraint(equalTo: viewGeneralContainer.centerYAnchor).isActive = true
        viewContainer.widthAnchor.constraint(equalTo: viewGeneralContainer.widthAnchor, constant: -32).isActive = true
        viewContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.addSubview(lblName)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 100).isActive = true
        lblName.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor, constant: -5).isActive = true

        contentView.addSubview(lblPosition)
        lblPosition.translatesAutoresizingMaskIntoConstraints = false
        lblPosition.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 100).isActive = true
        lblPosition.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor, constant: 10).isActive = true

        contentView.addSubview(imgNext)
        imgNext.translatesAutoresizingMaskIntoConstraints = false
        imgNext.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imgNext.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imgNext.leadingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant:-40).isActive = true
        imgNext.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        
        viewGeneralContainer.addSubview(avatarPlayer)
        avatarPlayer.translatesAutoresizingMaskIntoConstraints = false
        avatarPlayer.widthAnchor.constraint(equalToConstant: 90).isActive = true
        avatarPlayer.heightAnchor.constraint(equalToConstant: 90).isActive = true
        avatarPlayer.layer.cornerRadius = 45.00
        avatarPlayer.leadingAnchor.constraint(equalTo: viewGeneralContainer.leadingAnchor, constant: 8).isActive = true
        avatarPlayer.centerYAnchor.constraint(equalTo: viewGeneralContainer.centerYAnchor).isActive = true
       
    }
}
