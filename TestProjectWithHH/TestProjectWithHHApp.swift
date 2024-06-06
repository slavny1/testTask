//
//  TestProjectWithHHApp.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI

@main
struct TestProjectWithHHApp: App {
    @StateObject var vm = MainViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(vm)
            }
        }
    }
}

