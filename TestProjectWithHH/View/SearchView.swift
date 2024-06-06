//
//  SearchView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI

struct SearchView: View {

    @EnvironmentObject var vm: MainViewModel
    @State var search: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CustomTFView(isValid: .constant(true), text: $search, image: "glass", basicText: "Должность и ключевые слова")
                Button {
                    // action
                } label: {
                    Image("union")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(11)
                        .background(Color("lightGrey"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    TopElementView(
                        pic: "avatar",
                        text: "Вакансии рядом с вами\n",
                        button: nil
                    )
                    TopElementView(
                        pic: "avatar",
                        text: "Поднять резюме в поиске",
                        button: "Поднять"
                    )
                    TopElementView(
                        pic: "avatar",
                        text: "Временная\nработа и подработка",
                        button: nil
                    )
                    TopElementView(
                        pic: "avatar",
                        text: "Временная\nработа и подработка",
                        button: nil
                    )
                    Spacer()
                }
            }
            Text("Вакансии для вас")
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical)

            List(vm.vacancies, id: \.self) { vacancy in
                Text(vacancy.title)
            }
            Spacer()
            CustomButtonView(style: .green, action: {}, title: "Еще 100 вакансий")
        }
    }
}

#Preview {
    SearchView()
}
