//
//  ContentView.swift
//  App04-Listas
//
//  Created by David Josué Marcial Quero on 30/09/21.
//

import SwiftUI

struct ContentView: View {
    @State var maxAmount: String = "10"
    @State var orderBy: String = "relevance"
    @State var filter: String = ""
    var body: some View {
        NavigationView {
            TabView {
                SearchView(maxAmount: $maxAmount, orderBy: $orderBy, filter: $filter)
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                SettingsView(maxAmount: $maxAmount, orderBy: $orderBy, filter: $filter)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .navigationBarTitle("Book API", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
