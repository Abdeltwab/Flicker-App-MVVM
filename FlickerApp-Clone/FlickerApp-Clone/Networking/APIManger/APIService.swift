//
//  APIService.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation


class APIService<T> where T:EndPointProtocol {

    
    func request<D: Decodable>(target: T ,completion: @escaping (Result<D, Error>) -> Void) {
        var request = target.request
        request.httpMethod = target.httpMethod.rawValue
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    preconditionFailure("No error was received but we also don't have data...")
                }
                let json = String(data: data, encoding: .utf8)
                print(json ?? "")
                let decodedObject = try JSONDecoder().decode(D.self, from: data)
                
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

}

