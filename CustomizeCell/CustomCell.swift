//
//  CustomCell.swift
//  CustomizeCell
//
//  Created by Rosendo Vazquez on 01/12/22.
//
import UIKit
class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    
    lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00).cgColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    
    lazy var imgLogo: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(named: "itemLogo")
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
    }
    
     

}
