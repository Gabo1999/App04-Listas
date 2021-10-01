//
//  ContentView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
