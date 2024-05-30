//
//  CustomButtonView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI

enum ButtonStyle {
    case blue, clear, green, greenRound
}

struct CustomButtonView: View {

    var style: ButtonStyle
    var action: () -> Void
    var title: String

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(style == .clear ? .accent : .white)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(style == .clear ? .clear : style == .blue ? Color.accentColor : Color("activeGreen"))
                .clipShape(RoundedRectangle(cornerRadius: style == .greenRound ? 50 : 8))
        }
    }
}

#Preview {
    CustomButtonView(style: .blue, action: {}, title: "Title")
}
