//
//  TopElementView.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 06/06/24.
//

import SwiftUI

struct TopElementView: View {

    let pic: String
    let text: String
    let button: String?

    var body: some View {
        VStack(alignment: .leading) {
            Image(pic)
                .padding(.bottom)
            HStack {
                Text(text)
                    .font(.system(size: 14, weight: .medium))
                Spacer()
            }
            if let buttonText = button {
                Button {
                    // action
                } label: {
                    Text(buttonText)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(Color("activeGreen"))
                }
            }
        }
        .frame(width: 132)
        .padding(10)
        .background(Color("basicGrey"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
