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

enum HttpError: Codable, Error {
   case badURL
   case badResponse
   case errorDecodingData
   case invalidURL
//   case unauthorized

   var description: String {
      switch self {
      case .badURL:
         return "Bad URL"
      case .badResponse:
         return "Bad Response"
      case .errorDecodingData:
         return "Error Decoding Data"
      case .invalidURL:
         return "Invalid URL"
      }
   }
}

protocol HttpClient {
   func get<T>(route: Route) -> AnyPublisher<T, Error> where T: Decodable
}
