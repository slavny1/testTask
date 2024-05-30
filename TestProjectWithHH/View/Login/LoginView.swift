//
//  LoginView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI

struct LoginView: View {

    @Binding var email: String
    @State var isValid: Bool = true
    @Binding var isRegistered: Bool

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Поиск работы")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .padding(.vertical)

                CustomTFView(isValid: $isValid, text: $email, image: "respond", basicText: "Электронная почта и телефон")

                if !isValid {
                    Text("Введите корректный адрес почты")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.red)
                        .padding(.top, 2)
                        .padding(.bottom, 0)
                }

                HStack {
                    CustomButtonView(style: .blue, action: { validateEmail(email) }, title: "Продолжить")
                    CustomButtonView(style: .clear, action: {}, title: "Войти с паролем")
                }
                .padding(.top, 10)
                .padding(.bottom)
            }
            .greyRoundedBg
            .padding(.bottom)

            VStack(alignment: .leading) {
                Text("Поиск сотрудников")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .padding(.top)

                Text("Размещение вакансий и доступ к базе резюме")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.white)
                    .padding(.top, 1)

                CustomButtonView(style: .greenRound, action: {}, title: "Продолжить")
                    .padding(.vertical)
            }
            .greyRoundedBg
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Вход в личный кабинет")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top, 40)
            }
        }
    }

    private func validateEmail(_ email: String) {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        isRegistered = emailPredicate.evaluate(with: email)
        isValid = isRegistered
    }

}

#Preview {
    NavigationStack {
        LoginView(email: .constant(""), isRegistered: .constant(false))
    }
}
