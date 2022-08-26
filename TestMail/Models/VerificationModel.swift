//
//  VerificationModel.swift
//  TestMail
//
//  Created by Павел Кулицкий on 26.08.22.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@yahoo.com"]
    
    public var nameMail = String()
    public var filteredMailArray = [String]()
    
    private func filteringMails(text: String) {
        
        var domainMail = String()
        filteredMailArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        
        domainMail = String(range)
        
        mailsArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filteredMailArray.contains(mail) {
                    filteredMailArray.append(mail)
                }
            }
        }
    }
    
    public func getFilteredArray(text: String) {
        filteringMails(text: text)
    }
    
    private func deriveMainName(text: String) {
        guard let atSymbolIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: atSymbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        nameMail = String(range)
    }
    
    public func getNameMail(text: String) {
        deriveMainName(text: text)
    }
    
}
