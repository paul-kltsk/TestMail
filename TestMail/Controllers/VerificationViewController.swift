//
//  ViewController.swift
//  TestMail
//
//  Created by Павел Кулицкий on 25.08.22.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLabel = StatusLabel()
    private let mailTextFied = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailCollectionView(frame: .zero,
                                                    collectionViewLayout: UICollectionViewFlowLayout())

    private lazy var stackView = UIStackView(arrangedSubviews: [mailTextFied,
                                                                verificationButton,
                                                                collectionView],
                                        axis: .vertical,
                                        spacing: 20)
    
    private let verificationModel = VerificationModel()
    
    //MARK: -  View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
        
    }

    //MARK: -  setupViews
    private func setupViews() {
        view.addSubview(backgroundImage)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        verificationButton.addTarget(self, action: #selector(verificationButtonTapped), for: .touchUpInside)
    }
    
    //MARK: -  setDelegates
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailTextFied.textFieldDelegate = self
    }
    
    @objc private func verificationButtonTapped() {
        print("Button tapped")
    }

}

//MARK: -  UICollectionViewDataSource
extension VerificationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MailCollectionViewCell.className,
                                                            for: indexPath) as? MailCollectionViewCell
        else {
            return UICollectionViewCell()
            
        }
        
        let mailLabelText = verificationModel.filteredMailArray[indexPath.row]
        cell.cellConfigure(mailLabelText: mailLabelText)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        verificationModel.filteredMailArray.count
    }
    
}

//MARK: -  SelectProposedProtocol
extension VerificationViewController: SelectProposedMailProtocol {
    
    func selectProposedMail(indexPath: IndexPath) {
        guard let text = mailTextFied.text else { return }
        verificationModel.getNameMail(text: text)
        let domainName = verificationModel.filteredMailArray[indexPath.row]
        let mailFullName = verificationModel.nameMail + domainName
        mailTextFied.text = mailFullName
        statusLabel.isValid = mailFullName.isValid()
        verificationButton.isValid = mailFullName.isValid()
        verificationModel.filteredMailArray = []
        collectionView.reloadData()
    }
    
}

//MARK: - ActionsMailTextFieldProtocol
extension VerificationViewController: ActionsMailTextFieldProtocol {
    
    func typingText(text: String) {
        statusLabel.isValid = text.isValid()
        verificationButton.isValid = text.isValid()
        verificationModel.getFilteredArray(text: text)
        collectionView.reloadData()
        print(text)
    }
    
    func cleanOutTextField() {
        statusLabel.setDefaultSetting()
        verificationButton.setDefaultSetting()
        verificationModel.filteredMailArray = []
        collectionView.reloadData()
    }
    
}

//MARK: -  setConstraints
extension VerificationViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            mailTextFied.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
