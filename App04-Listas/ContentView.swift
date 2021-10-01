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
                        Text(verbatim: book.title)
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
