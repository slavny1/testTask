//
//  ContentView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State var selectedTab: TabItems = .search
    @State var email: String = ""
    @State var isRegistered = false
    @State var isCodeCorrect = false

    var body: some View {
        ZStack {
            if !isRegistered && !isCodeCorrect {
                LoginView(email: $email, isRegistered: $isRegistered)
                    .zIndex(1)
                    .background {
                        Color.black
                            .ignoresSafeArea()
                    }
            } else if isRegistered && !isCodeCorrect {
                CodeView(isCodeCorrect: $isCodeCorrect, email: email)
                    .zIndex(1)
                    .background {
                        Color.black
                            .ignoresSafeArea()
                    }
            }
            TabView(selection: $selectedTab) {
                ForEach(TabItems.allCases, id: \.self) { tab in
                    tab.view
                        .opacity(isCodeCorrect ? 1 : 0)
                        .tabItem {
                            Image(selectedTab == tab ? "\(tab.iconTab)Active" : tab.iconTab)
                            Text(tab.nameTab)
                        }
                        .tag(tab)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
