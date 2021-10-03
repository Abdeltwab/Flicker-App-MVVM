//
//  APIService.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation

//protocol APIServiceProtocol {
//    func request<T: Decodable>(target: EndPointProtocol ,completion: @escaping (Result<T, Error>) -> Void)
//}

class APIService<T> where T:EndPointProtocol {

//    func request<D: Decodable>(target: T ,completion: @escaping (Result<D, Error>) -> Void) {
//        let request = target.request
//    
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            do {
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                
//                guard let data = data else {
//                    preconditionFailure("No error was received but we also don't have data...")
//                }
//                
//                let decodedObject = try JSONDecoder().decode(D.self, from: data)
//                
//                completion(.success(decodedObject))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }

}

