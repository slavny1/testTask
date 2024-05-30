//
//  Ext+View.swift
//  TestProjectWithHH
//
//  Created by Viacheslav on 28/05/24.
//

import Foundation
import SwiftUI

extension View {
    var greyRoundedBg: some View {
        self.padding()
            .background(Color("basicGrey"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
