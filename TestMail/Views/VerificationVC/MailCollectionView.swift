//
//  MailCollectionView.swift
//  TestMail
//
//  Created by Павел Кулицкий on 25.08.22.
//

import Foundation
import UIKit

protocol SelectProposedMailProtocol: AnyObject {
    func selectProposedMail(indexPath: IndexPath)
}

class MailCollectionView: UICollectionView {
    
    weak var selectMailDelegate: SelectProposedMailProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        register(MailCollectionViewCell.self, forCellWithReuseIdentifier: MailCollectionViewCell.className)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        delegate = self
    }
    
}

//MARK: - UICollectionViewDelegate
extension MailCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMailDelegate?.selectProposedMail(indexPath: indexPath)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MailCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.frame.width/2 - 5, height: 40)
        
    }
    
}
