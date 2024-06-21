//
//  DateFormatter+Locale.swift
//  NewsView-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

public let TimeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    formatter.locale = Locale.current
    formatter.timeZone = TimeZone.current
    return formatter
}()

extension DateFormatter {
    
    public func string(from: TimeInterval?) -> String? {
        return from.flatMap { source in string(from: Date(timeIntervalSince1970: source)) }
    }
}
