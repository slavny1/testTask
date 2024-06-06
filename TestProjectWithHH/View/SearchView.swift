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

            ScrollView {
                ForEach(vm.vacancies.prefix(3), id: \.self) { vacancy in
                    NavigationLink {
                        ProfileView()
                    } label: {
                        CardView(vacancy: vacancy)
                    }
                }
            }
            Spacer()
            CustomButtonView(style: .green, action: {}, title: buttonTitle(for: vm.vacancies.count))
        }
    }

    private func buttonTitle(for count: Int) -> String {
        switch count {
        case 0:
            return "Еще 0 вакансий"
        case 1:
            return "Еще 1 вакансия"
        case 2...4:
            return "Еще \(count) вакансии"
        default:
            return "Еще \(count) вакансий"
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MainViewModel()
        return SearchView()
            .environmentObject(vm)
    }
}
