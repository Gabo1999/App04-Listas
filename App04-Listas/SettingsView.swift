//
//  SettingsView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 12/10/21.
//

import SwiftUI

struct SettingsView: View {
//    @Binding var maxAmount: String
//    @Binding var orderBy: String
//    @Binding var filter: String
    @Binding var backgroundColor: Color
    @ObservedObject var viewModel = BookListViewModel()
    let orderByOptions = ["newest", "relevance"]
    let filtersOptions = ["", "eboks", "free-books", "full", "paid-ebooks", "partial"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Cantidad de resultados ", text: $viewModel.maxAmount)
                Picker("Order By", selection: $viewModel.orderBy) {
                    ForEach(orderByOptions, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Filters", selection: $viewModel.filter) {
                    ForEach(filtersOptions, id: \.self) {
                        Text($0)
                    }
                }
                ColorPicker("Color del fondo", selection: $backgroundColor)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    //@State static var maxAmount: String = "10"
    //@State static var orderBy: String = "relevance"
    //@State static var filter: String = ""
    @State static var backgroundColor: Color = Color("Background")
    static var previews: some View {
        SettingsView(backgroundColor: $backgroundColor, viewModel: BookListViewModel())
    }
}
