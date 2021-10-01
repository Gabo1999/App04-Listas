//
//  Book.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI

struct Book: Identifiable {
    
    var id: String
    var title: String
    var subtitle: String
    var authors: [String]
    var publisher: String
    var description: String
    var imageLink: String
    
}

extension Book {
    static let dummy = Book(id: "asdkfjñsadf", title: "Old", subtitle: "Something",  authors: ["AlGO", "ALGUIEN"], publisher: "sdfñlkjasdf", description: "A group of families on a tropical holiday discover that the secluded beach where they are staying is somehow causing them to age rapidly – reducing their entire lives into a single day.", imageLink: "/qPKw2w4Ya5ZoOaxUDK1czRskQBT.jpg")
}
