//
//  CustomTFView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI

struct CustomTFView: View {

    @Binding var isValid: Bool
    @Binding var text: String
    @FocusState var isFocused: Bool

    var image: String
    var basicText: String

    var body: some View {
        ZStack {
            if text.isEmpty && !isFocused {
                HStack {
                    Image(image)
                    Text(basicText)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(.horizontal)
            }

            HStack {
                TextField("", text: $text)
                    .focused($isFocused)
                    .padding(.horizontal)

                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
        }
        .padding(.vertical, 10)
        .background(Color("lightGrey"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isValid ? Color.clear : Color.red, lineWidth: 1)
        )
        .onChange(of: text) { _, _ in
            isValid = true
        }

    }
}

#Preview {
    CustomTFView(isValid: .constant(false), text: .constant(""), image: "respond", basicText: "Электронная почта и телефон")
}
