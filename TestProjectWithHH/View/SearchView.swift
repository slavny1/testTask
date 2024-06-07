//
//  SearchView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import SwiftUI
import SwiftData

struct SearchView: View {

    @Query() private var favourites: [Favourite]
    @Environment(\.modelContext) private var context

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
                // TODO: Не было иконок всех нужных в фигме.
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
            CustomButtonView(style: .green, action: {}, title: buttonTitle(for: vm.vacancies.count))
        }
        .onAppear {
//            updateFavourites()
        }
    }

    private func updateFavourites() {
        for vacancy in vm.vacancies {
            if vacancy.isFavorite {
                if !favourites.contains (where: { $0.id == vacancy.id }) {
                    let fav = Favourite(id: vacancy.id)
                    context.insert(fav)
                }
            } else {
                if let fav = favourites.first(where: { $0.id == vacancy.id }) {
                    context.delete(fav)
                }
            }
        }
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
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
