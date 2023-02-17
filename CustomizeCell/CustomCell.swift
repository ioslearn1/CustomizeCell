//
//  CustomCell.swift
//  CustomizeCell
//
//  Created by Cesar Perez Catalan on 01/12/22.
//
import UIKit
import Alamofire

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    var logoText: String?
    
    lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00).cgColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    lazy var lblTeamName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Helveticaneue-bold", size: 40)
        return label
    }()
        
    lazy var imgLogo: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgLogo.image = nil
        
    }
    
    func getImageFromURL(url:String, imgLogo: UIImageView){

        AF.request(url).response{ [weak self] response in
            if let data = response.data{
                imgLogo.image = UIImage(data: data, scale: 1)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        setupCell()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(country: String,countryLogo: String){
        lblTeamName.text = country
        logoText = countryLogo
        
        getImageFromURL(url: countryLogo ?? "NONE", imgLogo: imgLogo)
    }
    
    func setupCell(){
        
        contentView.addSubview(viewContainer)
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        viewContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        viewContainer.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32).isActive = true
        viewContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -8).isActive = true
        
        contentView.addSubview(imgLogo)
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        imgLogo.widthAnchor.constraint(equalToConstant: 52).isActive = true
        imgLogo.heightAnchor.constraint(equalToConstant: 78).isActive = true
        imgLogo.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 8).isActive = true
        imgLogo.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        
        contentView.addSubview(lblTeamName)
        lblTeamName.translatesAutoresizingMaskIntoConstraints = false
        lblTeamName.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 100).isActive = true
        lblTeamName.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        
    }
}
