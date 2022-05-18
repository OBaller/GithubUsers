//
//  UserRow.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import SwiftUI
import SDWebImageSwiftUI //https://github.com/SDWebImage/SDWebImageSwiftUI.git

struct UserRow: View {
    let user: User
    @State var show = false
    
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: user.avatarUrl)!)
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(user.name)
                .fontWeight(.bold)
        }
        
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        let mockUser = User(id: 1, name: "cairocoders", avatarUrl: "", type: "")
        UserRow(user: mockUser)
    }
}
