//
//  NetworkRequest.swift
//  TestMail
//
//  Created by Павел Кулицкий on 28.08.22.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() { }
    
    func requestData(verifiableMail: String, complition: @escaping (Result<Data, Error>) -> Void) {
        
        let urlString = "https://api.kickbox.com/v2/verify?email=\(verifiableMail)&apikey=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
                
        URLSession.shared.dataTask(with: url) { data, response , error in
            DispatchQueue.main.async {
                if let error = error {
                    complition(.failure(error))
                    return
                }
                guard let data = data else { return }
                complition(.success(data))
            }
        }.resume()
        
    }
    
}
