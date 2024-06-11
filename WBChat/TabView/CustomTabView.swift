//
//  CustomTabView.swift
//  WBChat
//
//  Created by Александр on 11.06.2024.
//

import SwiftUI

struct CustomTabView: View {
    
    @StateObject var router: Router = .init()
    @State private var isDetailShowing: Bool = false
    
    var body: some View {
        VStack {
            TabView(selection: $router.selectedTab) {
                NavigationStack{
                    ContactsView(isDetailShowing: $isDetailShowing.animation(
                        .spring(
                            response: 0.2,
                            dampingFraction: 0.8)))
                        .tag(Tab.contacts)
                        .toolbar(.hidden, for: .tabBar)
                }
                .tint(.neutralText)
                Text("Чаты")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(ViewBackgroundColor())
                    .tag(Tab.chats)
                    .toolbar(.hidden, for: .tabBar)
                Text("Еще")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(ViewBackgroundColor())
                    .tag(Tab.more)
                    .toolbar(.hidden, for: .tabBar)
            }
            .overlay(alignment: .bottom) {
                if !isDetailShowing {
                    customTabView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ViewBackgroundColor())
    }
}


private extension CustomTabView {
    func customTabView() -> some View {
        VStack {
            Divider()
            HStack {
                ForEach(Tab.allCases) { tab in
                    CustomTabView_TabItem (
                        tab: tab,
                        foregroundColor: .neutralText,
                        isSelected: router.selectedTab == tab,
                        activeTab: $router.selectedTab
                    )
                }
            }
        }
    }
}

#Preview {
    CustomTabView()
}