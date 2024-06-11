//
//  ContactsView.swift
//  WBChat
//
//  Created by Александр on 07.06.2024.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var searchText: String = ""
    @Binding var isDetailShowing: Bool
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(Contact.contacts.indices, id: \.self) { index in
                    let contact = Contact.contacts[index]
                    NavigationLink(value: contact) {
                        ContactsView_ContactRow(
                            contact: contact,
                            isNeedTopPadding: index != 0)
                    }
                }
            }
            .navigationDestination(for: Contact.self) { contact in
                ContactDetailView(isDetailShowing: $isDetailShowing, contact: contact)
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ViewBackgroundColor())
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                viewTitle
            }
            ToolbarItem(placement: .topBarTrailing) {
                addButton
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension ContactsView {
    var viewTitle: some View {
        Text("Контакты")
            .font(.system(size: 18).weight(.semibold))
            .foregroundStyle(.neutralText)
    }
    
    var addButton: some View {
        Button("", systemImage: "plus") {

        }
        .frame(width: 24, height: 24)
        .fontWeight(.black)
        .labelStyle(.iconOnly)
        .tint(.neutralText)
    }
}

#Preview {
    NavigationStack {
        ContactsView(isDetailShowing: .constant(false))
    }
}
