//
//  NetworkError+Mapper.swift
//  LibraryData-Remote-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation
import Alamofire
import LibraryDomain_Model_Core

extension AFError {
    
    public func toNetworkError() -> NetworkError {
        switch self {
            case .sessionTaskFailed(let error as NSError):
                if error.domain == NSURLErrorDomain && error.code == NSURLErrorTimedOut {
                    return .timeout(code: -408, message: "Request timeout") // [-408] Session task failed < [408] Service unavailable.
                } else {
                    return .unknown(code: -503, message: error.localizedDescription) // [-503] Session task failed < [503] Service unavailable.
                }
            case .responseSerializationFailed(let reason):
                switch reason {
                    case .inputDataNilOrZeroLength:
                        return .serialization(code: -404, message: "Response data is nil or zero length") // [-404] Response data not found < [404] Not found.
                    case .decodingFailed(let error):
                        return .serialization(code: -412, message: "Decoding failed: \(error.localizedDescription)") // [-412] Decoding failed < [412] Precondition failed.
                    case .jsonSerializationFailed(let error):
                        return .serialization(code: -406, message: "JSON serialization failed: \(error.localizedDescription)") // [-406] SON serialization failed < [406] Not acceptable.
                    case .stringSerializationFailed(let error):
                        return .serialization(code: -417, message: "String serialization failed: \(error.rawValue)") // [-417] String serialization failed < [417] Expectation failed.
                    default:
                        return .serialization(code: -428, message: "Serialization failed") // [-428] String serialization failed < [428] Precondition required.
                }
            case .responseValidationFailed(let reason):
                switch reason {
                    case .unacceptableStatusCode(let code):
                        return .http(code: code, message: "Unacceptable status code: \(code)") // The response status code was not acceptable: not in 200 ~ 299.
                    default:
                        return .unknown(code: -426, message: "Response validation failed") // [-426] Response validation failed < [426] Upgraded required.
                }
            default:
                return .unknown(code: -501, message: "Unknown network error") // [-501] Unknown network error < [501] Not implemented.
        }
    }
}

extension Error {
    
    public func toNetworkError() -> Error {
        switch self {
            case let alamofire as AFError:
                return alamofire.toNetworkError()
            default:
                return self
        }
    }
}
