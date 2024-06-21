//
//  DateFormatter+UTC.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

public let UTCFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    formatter.locale = Locale(identifier: "en_UK")
    formatter.timeZone = TimeZone(identifier: "UTC")
    return formatter
}()

extension DateFormatter {
    
    public func time(from: String?) -> TimeInterval? {
        return from.flatMap { source in date(from: source)?.timeIntervalSince1970 }
    }
}
