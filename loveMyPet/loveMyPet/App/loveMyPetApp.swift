//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct loveMyPetApp: App {
    
    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    @State var selectedTab: TabContextView = .pets
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                CustomTabView(selectedTab: $selectedTab) {
                    CustomHomeNavigation {
                        HomeView(homeViewModel: homeViewModel)
                    } addView: {
                        EditPetView(updateHome: { homeViewModel.fetchAllPets() })
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    
                } configView: {
                    ConfigView()
                }
                .toolbar(selectedTab == .pets ? .visible : .hidden, for: .navigationBar)
                .navigationTitle(selectedTab == .pets ? TabContextView.pets.rawValue : "")
                .navigationBarTitleDisplayMode(selectedTab == .pets ? .inline : .large)
                .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
            }
        }
    }
}


