//
//  TabItems.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import Foundation
import SwiftUI

enum TabItems: CaseIterable {

    case search
    case heart
    case respond
    case messages
    case profile

    var nameTab: String {
        switch self {
        case .search:
            return "Поиск"
        case .heart:
            return "Избранное"
        case .respond:
            return "Отклики"
        case .messages:
            return "Сообщения"
        case .profile:
            return "Профиль"
        }
    }

    var iconTab: String {
        switch self {
        case .search:
            return "search"
        case .heart:
            return "heart"
        case .respond:
            return "respond"
        case .messages:
            return "messages"
        case .profile:
            return "profile"
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .search:
            SearchView()
        case .heart:
            HeartView()
        case .respond:
            RespondView()
        case .messages:
            MessagesView()
        case .profile:
            ProfileView()
        }
    }
}
