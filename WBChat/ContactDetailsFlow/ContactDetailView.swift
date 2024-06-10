//
//  ContactDetailView.swift
//  WBChat
//
//  Created by Александр on 07.06.2024.
//

import SwiftUI



struct ContactDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let contact: Contact
    var body: some View {
        VStack {
            ContactDetailView_UserAvatar(contact: contact)
                .padding(.top, 40)
            textContainer
            socialsStack
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ViewBackgroundColor())
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                backButton
            }
            ToolbarItemGroup(placement: .principal) {
                title
            }
            ToolbarItem(placement: .topBarTrailing) {
                editButton
            }
        }
    }
}



private extension ContactDetailView {
    var backButton: some View {
        Button{
            dismiss()
        } label: {
            Image(.backIcon)
                .resizable()
                .scaledToFit()
        }
        .frame(width: 24, height: 24, alignment: .trailing)
        .padding(6)
        .tint(.neutralText)
    }
    
    
    var title: some View {
        HStack{
            Text("Профиль")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .tint(.neutralText)
            Spacer()
        }
    }
    
    var editButton: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(.edit)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        })
        .tint(.neutralText)
    }
    
    var socialsStack: some View {
        HStack(spacing: 12) {
            ForEach(Socials.allCases) { social in
                Button {
                } label: {
                    Image(social.icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.brand)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 26)
                        .background(Capsule().stroke(.brand, lineWidth: 1.67))
                }
            }
        }
        .padding(.top, 40)
    }
    
    var textContainer: some View {
        VStack(spacing: 4){
            Text(contact.name)
                .font(.system(size: 24).weight(.semibold))
            Text("+7\(contact.phoneNumber)")
                .font(.system(size: 16))
                .foregroundStyle(.neutralDisabled)
        }
        .padding(.top, 20)
    }
}


#Preview {
    struct BindingViewPreviewContainer : View {
        var body: some View {
            NavigationStack {
                ContactDetailView(
                    contact: .init(
                        name: "Петя",
                        phoneNumber: "6666666666",
                        status: "Онлайн",
                        isOnline: true,
                        hasNewStories: true,
                        avatar: .Avatars.petya
                    )
                )
            }
        }
    }
    return BindingViewPreviewContainer()
}