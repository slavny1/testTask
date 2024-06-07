//
//  HeartView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI
import SwiftData

struct HeartView: View {

    @Query() private var favourites: [Favourite]
    @Environment(\.modelContext) private var context

    @EnvironmentObject var vm: MainViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Избранное")
                .font(.system(size: 20, weight: .semibold))
                .padding(.top, 40)

            HStack {
            Text(buttonTitle(for: favourites.count))
                .padding(.vertical, 5)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(Color("textGrey"))
                Spacer()
            }

            ScrollView {
                ForEach(filteredVacancies, id: \.self) { vacancy in
                    NavigationLink {
                        VacancyDetailView(isFavourite: getFavourites(vacancy.id),
                                          vacancy: vacancy,
                                          action: {
                            addRemoveFavourites(vacancy.id)
                        })
                    } label: {
                        CardView(isFavourite: getFavourites(vacancy.id),
                                 vacancy: vacancy,
                                 action: {
                            addRemoveFavourites(vacancy.id)
                        })
                    }
                }
            }
            Spacer()
        }
    }

    private var filteredVacancies: [Vacancy] {
        vm.vacancies.filter { vacancy in
            favourites.contains { $0.id == vacancy.id }
        }
    }

    private func getFavourites(_ id: String) -> Bool {
        return favourites.contains { $0.id == id }
    }

    private func addRemoveFavourites(_ id: String) {
        if let fav = favourites.first(where: { $0.id == id }) {
            context.delete(fav)
        } else {
            let fav = Favourite(id: id)
            context.insert(fav)
        }

        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    private func buttonTitle(for count: Int) -> String {
        switch count {
        case 1:
            return "1 вакансия"
        case 2...4:
            return "\(count) вакансии"
        default:
            return "\(count) вакансий"
        }
    }
}


struct HeartView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            let vm = MainViewModel()
            return HeartView()
                .environmentObject(vm)
        }
    }
}
