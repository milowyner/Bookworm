//
//  Book+FormattedDate.swift
//  Bookworm
//
//  Created by Milo Wyner on 8/23/21.
//

import Foundation

extension Book {
    var formattedDate: String? {
        guard let date = date else { return nil }
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
