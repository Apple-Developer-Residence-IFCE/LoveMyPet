//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct LoveMyPetApp: App {
    @AppStorage("showOnBoarding") var showOnBoarding: Bool = true
    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    @State var selectedTab: TabContextView = .pets
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var addViewModel = EditPetViewModel()
    @ObservedObject var taskViewModel = TaskViewModel()
    @ObservedObject var configViewModel = ConfigViewModel()

    var body: some Scene {
        WindowGroup {
            if showOnBoarding {
                NavigationView {
                    OnBoardView()
                }
            } else {
                CustomTabView(selectedTab: $selectedTab) {
                    CustomHomeNavigation {
                        HomeView(homeViewModel: homeViewModel)
                    } addView: {
                        EditPetView(addViewModel: addViewModel)
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    } action: {
                        addViewModel.updatePet()
                        Helper.shared.addButtonDisable = true
                    } update: {
                        homeViewModel.fetchAllPets()
                        addViewModel.newPet = NewPet()
                    }
                }
            configView: {
                ConfigView()
                    .environmentObject(configViewModel)
            } taskView: {
                CustomTaskNavigation {
                    TaskView()
                        .environmentObject(taskViewModel)
                } addTaskView: {

                } update: {

                }
            }
            .toolbar(selectedTab == .pets ? .visible : .hidden, for: .navigationBar)
            .navigationTitle(selectedTab == .pets ? TabContextView.pets.rawValue : "")
            .navigationBarTitleDisplayMode(selectedTab == .pets ? .inline : .large)
            .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
            }
        }
    }
}
