//
//  ApiBuilder.swift
//  LibraryData-Remote-Core
//
//  Created by Richard on 2024.06.19
//

import Foundation
import OSLog
import Combine
import Alamofire

public class ApiBuilder {
    
    // MARK: - Instance functions.
    
    public init(
        server: ApiServer
    ) {
        _server = server
    }
    
    private var _server: ApiServer
    
    // MARK: - Headers.
    
    private var _headers: HTTPHeaders? = nil
    public func header(_ headers: HTTPHeaders) -> ApiBuilder {
        _headers = headers
        return self
    }
    
    // MARK: - Content type.
    
    private var _contentType: [String] = ["application/json"]
    public func contentType(_ contentType: [String]) -> ApiBuilder {
        _contentType = contentType
        return self
    }
    
    // MARK: - Log request interceptor.
    
    private let _logRequestInterceptor = LogRequestInterceptor()
    struct LogRequestInterceptor: RequestInterceptor {
        
        func adapt(
            _ urlRequest: URLRequest,
            for session: Session,
            completion: @escaping (Result<URLRequest, Error>
            ) -> Void) {
#if DEBUG
            let method = urlRequest.method?.rawValue ?? "UNKNOWN"
            let uri = urlRequest.url?.absoluteString ?? ""
            print("REQUEST \(method) \(uri)")
#endif
            completion(.success(urlRequest))
        }
    }
    
    // MARK: - Log response interceptor.
    
    private func logResponseValidator(request: URLRequest?, response: HTTPURLResponse, data: Data?) {
#if DEBUG
        let method = request?.method?.rawValue ?? "UNKNOWN"
        let uri = request?.url?.absoluteString ?? ""
        let status = response.statusCode
        let description = HTTPURLResponse.localizedString(forStatusCode: status).uppercased()
        print("RESPONSE [\(status): \(description)] \(method) \(uri)")
#endif
    }
    
    // MARK: - Build.
    public func request<T: Decodable>(
        method: HTTPMethod,
        uri: String,
        parameters: Parameters? = nil
    ) -> AnyPublisher<T, some Error> {
        let session = Session.default
        session.sessionConfiguration.timeoutIntervalForRequest = 8
        return session.request(
            "\(_server.rawValue)\(uri)".fixHTTP(),
            method: method,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: _headers,
            interceptor: _logRequestInterceptor
        ).validate({ request, response, data in
            self.logResponseValidator(request: request, response: response, data: data)
            return .success(())
        }).validate(statusCode: 200 ..< 300)
            .validate(contentType: self._contentType)
            .publishDecodable(queue: DispatchQueue.global(qos: .background))
            .value()
    }
}
