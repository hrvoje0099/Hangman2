//
// Networking
// Hangman2
//
// Created by Hrvoje
//

import Combine
import Foundation

final class Networking: HttpClient {
   let baseURL = Constants.Request.baseURL

   func get<T>(route: Route) -> AnyPublisher<T, Error> where T: Decodable {
      guard let url = URL(string: self.baseURL + route.endpoint) else {
         return Fail(error: HttpError.invalidURL).eraseToAnyPublisher()
      }

      var urlRequest = URLRequest(url: url)
      urlRequest.httpMethod = route.method.rawValue

      return URLSession.shared
         .dataTaskPublisher(for: urlRequest)
         .map(\.data)
         .decode(type: T.self, decoder: JSONDecoder())
//         .mapError { error in
//            switch error {
//            case is DecodingError:
//               return .errorDecodingData
//            case is URLError:
//               return .badURL
//            default:
//               return .badResponse
//            }
//         }
         .eraseToAnyPublisher()
   }
}
