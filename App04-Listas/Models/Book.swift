//
//  Book.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI

struct Book: Decodable {
    
    var id: String
    var title: String
    var subtitle: String
    var authors: [String]
    var publisher: String
    var description: String
    var imageLink: String
    
}
