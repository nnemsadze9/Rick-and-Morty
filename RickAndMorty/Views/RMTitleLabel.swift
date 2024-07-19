//
//  RMBodyLabel.swift
//  RickAndMorty
//
//  Created by User on 17.07.24.
//

import UIKit

class RMTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init( fontsize: CGFloat ){
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontsize, weight: .bold)
        configure()
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
    }
    
}
