//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by User on 17.07.24.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    //MARK: - Views
    let avatarImageView = RMAvatarImageView(frame: .zero)
    let nameLabel = RMTitleLabel(fontsize: 30)
    let speciesLabel = RMTitleLabel(fontsize: 30)
    let genderLabel = RMTitleLabel(fontsize: 30)
    let createdLabel = RMTitleLabel(fontsize: 30)
    
    //
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
      
       }

     func set(character : Model){
         nameLabel.text = character.nameText
         speciesLabel.text = "Specie: " + character.speciesText
         genderLabel.text = "Gender: " + character.genderText
         createdLabel.text = "Created: " + character.createdText.prefix(10)
         ImageCacheManager.shared.fetchImage(from: character.imageNameText, completed: { [weak self] image in
             DispatchQueue.main.async {
                 self?.avatarImageView.image = image
             }
         }
         )
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
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.View.topAnchorSpacing),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.View.avatarImageViewLeadingSpacing),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.View.avatarImageViewSpacing),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.View.avatarImageViewSpacing),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: Constants.View.topAnchorSpacing),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.View.labelLeadingSpacing),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: Constants.View.heightAnchorSpacing),
            
            speciesLabel.centerYAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.View.topAnchorSpacing),
            speciesLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.View.labelLeadingSpacing),
            speciesLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            speciesLabel.heightAnchor.constraint(equalToConstant: Constants.View.heightAnchorSpacing),
            
            genderLabel.centerYAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: Constants.View.topAnchorSpacing),
            genderLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.View.labelLeadingSpacing),
            genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            genderLabel.heightAnchor.constraint(equalToConstant: Constants.View.heightAnchorSpacing),
            
            createdLabel.centerYAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: Constants.View.topAnchorSpacing),
            createdLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.View.labelLeadingSpacing),
            createdLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            createdLabel.heightAnchor.constraint(equalToConstant: Constants.View.heightAnchorSpacing),
            
        ])
        
    }
    
}

extension CharacterCell{
    struct Constants{
        struct View{
            static let topAnchorSpacing : CGFloat = 13
            static let heightAnchorSpacing : CGFloat = 20
            static let avatarImageViewLeadingSpacing : CGFloat = 12
            static let avatarImageViewSpacing : CGFloat = 100
            static let labelLeadingSpacing : CGFloat = 12
            
        }
    }
}
