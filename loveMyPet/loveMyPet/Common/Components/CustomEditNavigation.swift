//
//  CustomEditNavigation.swift
//  loveMyPet
//
//  Created by Ravi on 16/06/23.
//

import SwiftUI

struct CustomEditNavigation<Detail: View, Edit: View>: View {

    @ViewBuilder let detailPet: Detail
    @ViewBuilder let editView: Edit
    @State private var showingPopover = false
    var update: () -> Void

    var body: some View {
        detailPet
            .navigationTitle(Text(Constants.Home.infoPetTitle)
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingPopover = true
                    } label: {
                        Text(Constants.Home.edit)
                            .foregroundColor(Color(CustomColor.MainColor))
                            .font(.custom(Font.SemiBold, size: 16))
                    }
                }
            }
            .sheet(isPresented: $showingPopover, onDismiss: { update() }) {
                NavigationView {
                    editView
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button {
                                    showingPopover = false
                                } label: {
                                    Text(Constants.Home.cancel)
                                        .foregroundColor(Color(CustomColor.MainColor))
                                        .font(.custom(Font.Regular, size: 16))
                                }
                            })
                        }
                }
            }
    }
}
