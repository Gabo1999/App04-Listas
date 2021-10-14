//
//  SearchView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 12/10/21.
//

import SwiftUI

struct SearchView: View {
    //@Binding var maxAmount: String
    //@Binding var orderBy: String
    //@Binding var filter: String
    @Binding var backgroundColor: Color
    @ObservedObject var viewModel = BookListViewModel()
    
    init (backgroundColor: Binding<Color>, viewModel: BookListViewModel) {
        self._backgroundColor = backgroundColor
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = UIColor(self.backgroundColor)
    }
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
                    //.background(backgroundColor)
                }
            }
            .navigationBarTitle(Text("Books"))
        }
        //.background(backgroundColor)
    }
}

struct SearchView_Previews: PreviewProvider {
    //@State static var maxAmount: String = "10"
    //@State static var orderBy: String = "relevance"
    //@State static var filter: String = ""
    @State static var backgroundColor: Color = Color("Background")
    
    static var previews: some View {
        SearchView(backgroundColor: $backgroundColor, viewModel: BookListViewModel())
    }
}
