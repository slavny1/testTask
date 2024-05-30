//
//  SearchView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI

struct SearchView: View {

    @State var search: String = ""

    private let dataManager = DataManager()
    private var isJobReady = false

    var jobsToShow: [JobModel] = []

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
                    TopElementView(pic: "avatar", text: "Временная\nработа и подработка")
                    TopElementView(pic: "avatar", text: "Временная\nработа и подработка")
                    TopElementView(pic: "avatar", text: "Временная\nработа и подработка")
                    TopElementView(pic: "avatar", text: "Временная\nработа и подработка")
                    Spacer()
                }
            }
            Text("Вакансии для вас")
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical)
            if !isJobReady {
                Spacer()
                HStack {
                    Spacer()
                    ProgressView("Идет загрузка")
                    Spacer()
                }
                Spacer()
            } else {
                ScrollView {
                    
                }
            }
            Spacer()
            CustomButtonView(style: .green, action: {}, title: "Еще 100 вакансий")
        }
    }
}

struct TopElementView: View {

    let pic: String
    let text: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(pic)
                .padding(.bottom)
            HStack {
                Text(text)
                    .font(.system(size: 14, weight: .medium))
                Spacer()
            }
        }
        .frame(width: 132)
        .padding(10)
        .background(Color("basicGrey"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    SearchView()
}
