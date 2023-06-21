//
//  CastradPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI
import CoreData

struct CastradPicker: View {
    
    @State var viewModel: EditPetViewModel
    
    var body: some View {
        Picker("", selection: viewModel.isAddPetFlow ? $viewModel.newPet.isNeutered : $viewModel.selectedPet.isNeutered) {
            ForEach(0..<2, id: \.self) {
                Text(($0 == 0) ? Constants.yes : Constants.no)
                    .tag($0 == 0)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Font.Regular, size: 16))
        .pickerStyle(.menu)
    }
}
