//
//  SearchView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 12/10/21.
//

import SwiftUI

struct SearchView: View {
    @Binding var maxAmount: String
    @Binding var orderBy: String
    @Binding var filter: String
    
    @ObservedObject var viewModel = BookListViewModel()
    var body: some View {
        NavigationView {
            Group {
               VStack {
                    SearchBar(text: $viewModel.searchTerm,
                              onSearchButtonClicked: viewModel.onSearchTapped)
                    List(viewModel.books, id: \.title) { book in
                        NavigationLink(destination: BookDetailView(mediaModel: viewModel, book: book)) {
                            BookRowView(book: book, width: 180.0)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Books"))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var maxAmount: String = "10"
    @State static var orderBy: String = "relevance"
    @State static var filter: String = ""
    
    static var previews: some View {
        SearchView(maxAmount: $maxAmount, orderBy: $orderBy, filter: $filter)
    }
}
