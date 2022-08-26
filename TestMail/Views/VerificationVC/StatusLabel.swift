//
//  StatusLabel.swift
//  TestMail
//
//  Created by Павел Кулицкий on 25.08.22.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    public var isValid = false {
        didSet {
            if self.isValid {
                setValidSetting()
            } else {
                setNotValidSetting()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check your email"
        textColor = #colorLiteral(red: 0.9450980392, green: 0.9333333333, blue: 0.862745098, alpha: 1)
        font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSetting() {
        text = "Mail is not valid. Ex: name@domain.ru"
        textColor = .systemRed
    }
    
    private func setValidSetting() {
        text = "Mail is valid"
        textColor = .systemGreen
    }
    
    public func setDefaultSetting() {
        configure()
    }
    
}
