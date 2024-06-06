//
//  CardView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 06/06/24.
//

import SwiftUI

struct CardView: View {

    let vacancy: Vacancy
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                if let num = vacancy.lookingNumber {
                    Text(buttonTitle(for: num))
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color("activeGreen"))
                }
                Text(vacancy.title)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.vertical, 5)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                if let salary = vacancy.salary.short {
                    Text(salary)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color.white)

                }
                Text(vacancy.address.town)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.top, 5)
                    .foregroundStyle(Color.white)
                HStack {
                    Text(vacancy.company)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.white)
                    Image("icon")
                }
                HStack {
                    Image("suit")
                    Text(vacancy.publishedDate)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.white)
                }
                Text(formatPublicationDate(vacancy.publishedDate))
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color("textGrey"))

                Spacer()

            }
            Spacer()
            Button {
                // add to favourites
            } label: {
                Image("heart")
            }
        }
        .greyRoundedBg
    }

    private func buttonTitle(for count: Int) -> String {
        switch count {
        case 2...4:
            return "Сейчас просматривает \(count) человека"
        default:
            return "Сейчас просматривает \(count) человек"
        }
    }

    private func formatPublicationDate(_ publishedDate: String) -> String {
        let components = publishedDate.split(separator: "-")
        guard components.count == 3,
              let day = Int(components[2]),
              let month = Int(components[1]) else {
            return "Некорректная дата"
        }

        let monthString: String
        switch month {
        case 1: monthString = "января"
        case 2: monthString = "февраля"
        case 3: monthString = "марав"
        case 4: monthString = "апреля"
        case 5: monthString = "мая"
        case 6: monthString = "июня"
        case 7: monthString = "июля"
        case 8: monthString = "августа"
        case 9: monthString = "сентября"
        case 10: monthString = "октября"
        case 11: monthString = "ноября"
        case 12: monthString = "декабря"
        default: monthString = ""
        }

        return "Опубликовано \(day) \(monthString)"
    }
}

