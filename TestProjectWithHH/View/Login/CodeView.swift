//
//  CodeView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 30/05/24.
//

import SwiftUI

struct CodeView: View {

    @Binding var isCodeCorrect: Bool
    @State var code: [String] = ["", "", "", ""]
    var email: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Отправили код на \(email)")
                .font(.system(size: 20, weight: .semibold))
                .padding(.bottom, 10)

            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.system(size: 16, weight: .medium))

            FourDigitInputView(code: $code)

            CustomButtonView(style: .blue, action: { checkCode() }, title: "Подтвердить")
        }
        .padding(.horizontal)
    }

    private func checkCode() {
        isCodeCorrect = code.map { Int($0) }.count == 4
        print(code)
    }
}

struct FourDigitInputView: View {
    @Binding var code: [String]
    @FocusState private var focusedField: Int?

    var body: some View {
        HStack(spacing: 10) {
            Spacer()
            ForEach(0..<4) { index in
                TextField("*", text: Binding(
                    get: { code[index] },
                    set: { newValue in
                        if newValue.count <= 1 {
                            code[index] = newValue
                            if newValue.count == 1 {
                                if index < 3 {
                                    focusedField = index + 1
                                } else {
                                    focusedField = nil
                                }
                            }
                        }
                    })
                )
                .focused($focusedField, equals: index)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .frame(width: 50, height: 50)
                .background(RoundedRectangle(cornerRadius: 8).foregroundStyle(Color("lightGrey")))
            }
            Spacer()
        }
        .padding()
        .onAppear {
            focusedField = 0 // Focus the first field when the view appears
        }
    }
}

#Preview {
    CodeView(isCodeCorrect: .constant(false), email: "email@email.com")
}
