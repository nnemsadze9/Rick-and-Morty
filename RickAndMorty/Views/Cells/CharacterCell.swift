//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by User on 17.07.24.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    let avatarImageView = RMAvatarImageView(frame: .zero)
    let nameLabel = RMTitleLabel(fontsize: 30)
    let speciesLabel = RMTitleLabel(fontsize: 30)
    let genderLabel = RMTitleLabel(fontsize: 30)
    let createdLabel = RMTitleLabel(fontsize: 30)
    
    let padding : CGFloat = 13
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
      
       }

     func set(character : Character){
        nameLabel.text = "Name: " + character.name
        speciesLabel.text = "Specie: " + character.species
        genderLabel.text = "Gender: " + character.gender
        createdLabel.text = "Created: " + character.created.prefix(10)
         avatarImageView.downloadImage(from: character.image)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    
    private func configure(){
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(speciesLabel)
        addSubview(genderLabel)
        addSubview(createdLabel)
        
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            speciesLabel.centerYAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            speciesLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            speciesLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            speciesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genderLabel.centerYAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: padding),
            genderLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            genderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            createdLabel.centerYAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: padding),
            createdLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            createdLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            createdLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        
    }
}
