//
//  MailResponseModel.swift
//  TestMail
//
//  Created by Павел Кулицкий on 29.08.22.
//

import Foundation

struct MailResponseModel: Decodable {
    let result: String
    let reason: String
    let didYouMean: String?
    let success: Bool
    
    var reasonDescription: String {
        switch reason {
        case "invalidEmail" :
            return "Specified email is not a valid email address syntax"
        case "invalidDomain" :
            return "Domain for email does not exist"
        case "rejectedEmail" :
            return "Email address was rejected by the SMTP server, email address does not exist"
        case "acceptedEmail" :
            return "Email address was accepted by the SMTP server"
        case "lowQuality" :
            return "Email address has quality issues that may make it a risky or low-value address"
        case "lowDeliverability" :
            return "Email address appears to be deliverable, but deliverability cannot be guaranteed"
        case "noConnect" :
            return "Could not connect to SMTP server"
        case "timeout" :
            return "SMTP session timed out"
        case "invalidSmtp" :
            return "SMTP server returned an unexpected/invalid response"
        case "unavailableSmtp" :
            return "SMTP server was unavailable to process our request"
        case "unexpectedError" :
            return "An unexpected error has occurred"
        default: return "No data"
        }
    }
    
    
    
}
