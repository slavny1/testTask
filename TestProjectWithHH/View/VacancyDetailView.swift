//
//  VacancyDetailView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 07/06/24.
//

import SwiftUI

struct VacancyDetailView: View {

    @Environment(\.presentationMode) var presentationMode
    @State var isFavourite: Bool
    let vacancy: Vacancy
    let action: () -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                Text(vacancy.title)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.vertical)

                Text(vacancy.salary.full)
                    .font(.system(size: 14, weight: .regular))
                Text("Требуемый опыт: \(vacancy.experience.previewText)")
                    .font(.system(size: 14, weight: .regular))
                Text(capitalizeFirstLetter(array: vacancy.schedules))
                    .font(.system(size: 14, weight: .regular))

                statuses

                map

                if let description = vacancy.description {
                    Text(description)
                }

                Text("Ваши задачи")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top)
                    .padding(.bottom, 5)
                Text(vacancy.responsibilities)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.bottom)
                Text("Задайте вопрос работадателю")
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.bottom, 2)
                Text("Он получит его с откликом на вакансию")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color("textGrey"))
                ForEach(vacancy.questions, id: \.self) { question in
                    Text(question)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color("lightGrey"))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                CustomButtonView(style: .green, action: {}, title: "Откликнуться")
                    .padding(.top)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                        Image(systemName: "eye")
                            .foregroundStyle(Color.white)
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white)
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    action()
                }, label: {
                    isFavourite ? Image("heartFill") : Image("heart")
                })
            }
        }
    }

    @ViewBuilder
    private var map: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(vacancy.company)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.white)
                Image("icon")
            }
            Image("map")
                .resizable()
                .scaledToFit()
            Text(vacancy.address.town + ", " + vacancy.address.street + ", " + vacancy.address.house)
        }
        .greyRoundedBg
        .padding(.vertical)
    }

    @ViewBuilder
    private var statuses: some View {
        HStack {
            if let appliedNumber = vacancy.appliedNumber {
                HStack(alignment: .top) {
                    Text("\(buttonTitle(for: appliedNumber)) уже откликнулось")
                    Spacer()
                    Image("people")
                }
                .padding(10)
                .background(Color("datkGreen"))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            }

            if let lookingNumber = vacancy.lookingNumber {
                HStack(alignment: .top) {
                    Text("\(buttonTitle(for: lookingNumber)) сейчас смотрят")
                    Spacer()
                    Image("eye")
                }
                .padding(10)
                .background(Color("datkGreen"))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(.top)
    }

    private func capitalizeFirstLetter(array: [String]) -> String {
        var result = array.joined(separator: ", ")
        guard let first = result.first else { return result }
        return first.uppercased() + result.dropFirst()
    }

    private func buttonTitle(for count: Int) -> String {
        switch count {
        case 2...4:
            return "\(count) человека"
        default:
            return "\(count) человек"
        }
    }
}

#Preview {
    NavigationStack {
        VacancyDetailView(
            isFavourite: true,
            vacancy: Vacancy(
                id: "",
                lookingNumber: 2,
                title: "Title",
                address: Address(town: "town", street: "Str", house: "2"),
                company: "Company name",
                experience: Experience(previewText: "preview", text: "Nore"),
                publishedDate: "1232-23-23",
                isFavorite: true,
                salary: Salary(full: "full 1000", short: "1023"),
                schedules: ["Schedule"],
                appliedNumber: 4,
                description: "Description",
                responsibilities: "Responsib",
                questions: ["Question1", "Question 2"]
            ),
            action: {}
        )
    }
}
