//
//  BookDetailView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI
import Kingfisher

struct BookDetailView: View {
    
    @StateObject var mediaModel = BookListViewModel()
    
    var book: Book
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    KFImage(URL(string: book.imageLink))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180.0, height: 180.0/0.667)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    if (!book.subtitle.isEmpty) {
                        Text("\(book.title): \(book.subtitle)")
                            .frame(width: 300.0)
                            .multilineTextAlignment(.center)
                            .font(.title)
                    } else {
                        Text(book.title)
                            .frame(width: 300.0)
                            .multilineTextAlignment(.center)
                            .font(.title)
                    }
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(book.authors, id: \.self) { g in
                                Text(g)
                                    .font(.title2)
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                        }
                    }
                    Spacer()
                    Text(book.publisher)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(width: 260.0)
                        .padding()
                    Spacer()
                    Text(book.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0)
                }
                .padding(.horizontal, 20)
                .navigationBarTitle(book.title, displayMode: .inline)
            }
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(mediaModel: BookListViewModel(), book: Book.dummy)
    }
}
