//
//  SettingsView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 12/10/21.
//

import SwiftUI

struct SettingsView: View {
    @Binding var maxAmount: String
    @Binding var orderBy: String
    @Binding var filter: String
    let orderByOptions = ["newest", "relevance"]
    let filtersOptions = ["eboks", "free-books", "full", "paid-ebooks", "partial"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Cantidad de resultados ", text: $maxAmount)
                Picker("Order By", selection: $orderBy) {
                    ForEach(orderByOptions, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Filters", selection: $filter) {
                    ForEach(filtersOptions, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var maxAmount: String = "10"
    @State static var orderBy: String = "relevance"
    @State static var filter: String = ""
    
    static var previews: some View {
        SettingsView(maxAmount: $maxAmount, orderBy: $orderBy, filter: $filter)
    }
}
