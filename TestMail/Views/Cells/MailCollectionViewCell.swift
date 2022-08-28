//
//  MailCollectionViewCell.swift
//  TestMail
//
//  Created by Павел Кулицкий on 25.08.22.
//

import Foundation
import UIKit

class MailCollectionViewCell: UICollectionViewCell {
    
    private let domainLabel: UILabel = {
        let label = UILabel()
//        label.text = "@gmail.com"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.8
        contentView.layer.cornerRadius = 10
        
        addSubview(domainLabel)
    }
    
    private func configure(mailLabelText: String) {
        domainLabel.text = mailLabelText
    }
    
    public func cellConfigure(mailLabelText: String) {
        configure(mailLabelText: mailLabelText)
    }
    
}

extension MailCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
