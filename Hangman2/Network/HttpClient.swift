//
// HttpClient
// Hangman2
//
// Created by Hrvoje
//

import Combine
import Foundation

enum HttpMethods: String {
   case POST, GET, PUT, PATCH, DELETE
}

enum MIMEType: String {
   case JSON = "application/json"
}

enum HttpHeaders: String {
   case contentType = "Content-Type"
}

enum NetworkingError: Error {
   case invalidURL
}

protocol HttpClient {
   func get<T>(route: Route) -> AnyPublisher<T, Error> where T: Decodable
}
