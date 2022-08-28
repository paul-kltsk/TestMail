//
//  NetworkDataFetch.swift
//  TestMail
//
//  Created by Павел Кулицкий on 29.08.22.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchMail(verifableMail: String, response: @escaping (MailResponseModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData(verifiableMail: verifableMail) { result in
            switch result {
                
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let mail = try jsonDecoder.decode(MailResponseModel.self, from: data)
                    response(mail, nil)
                } catch let jsonError{
                    print("Failed to decode", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data", error.localizedDescription)
                response(nil, error)
            }
        }
    }
    
}
