//
//  BookRowView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI

import Kingfisher

struct BookRowView: View {
    var book: Book
    var width: CGFloat
    var body: some View {
        VStack {
            Print(book.imageLink, "SSOMETHING")
            HStack {
                KFImage(URL(string: book.imageLink))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width - 40, height: (width - 40)/0.667)
                    .cornerRadius(40)
                    .overlay(
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.yellow, style: StrokeStyle(
                                            lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                        }
                    )
                    .padding(.top, 10)
                    Spacer()
                    VStack {
                        if (!book.subtitle.isEmpty) {
                            Text("\(book.title): \(book.subtitle)")
                                .frame(width: width - 40)
                                .multilineTextAlignment(.center)
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                        } else {
                            Text(book.title)
                                .frame(width: width - 40)
                                .multilineTextAlignment(.center)
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                        }
                        ForEach(book.authors, id: \.self) { author in
                            Text(author)
                        }
                    }
                }
            }
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView(book: Book.dummy, width: 50.0)
    }
}
