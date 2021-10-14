//
//  BookModel.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

final class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    var searchTerm: String = ""
    @Published var maxAmount: String = "10"
    @Published var filter: String = ""
    @Published var orderBy: String = "relevance"
    init() {
        
    }

    func onSearchTapped() {
        self.books.removeAll()
        let replaced = searchTerm.replacingOccurrences(of: " ", with: "%20")
        let URL = "https://www.googleapis.com/books/v1/volumes?q=\(replaced)&\(filter != "" ? "filter=\(filter)" : "")&maxResults=\(maxAmount)&orderBy=\(orderBy)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in

            let json = try! JSON(data: data.data!)
            //print(json)
            //var books = [Book]()
            var book: Book
            var authors = [String]()
        
            for b in json["items"] {
                authors.removeAll()
                for a in b.1["volumeInfo"]["authors"] {
                    authors.append(a.1.stringValue)
                }
                let https = "https" + b.1["volumeInfo"]["imageLinks"]["smallThumbnail"].stringValue.dropFirst(4)
                book = Book(id: b.1["id"].stringValue, title: b.1["volumeInfo"]["title"].stringValue, subtitle: b.1["volumeInfo"]["subtitle"].stringValue, authors: authors, publisher: b.1["volumeInfo"]["publisher"].stringValue, description: b.1["volumeInfo"]["description"].stringValue, imageLink: https)
                self.books.append(book)
            }
        }
    }

}
