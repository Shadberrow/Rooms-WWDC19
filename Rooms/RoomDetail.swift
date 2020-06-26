//
//  RoomDetail.swift
//  Rooms
//
//  Created by Yevhenii on 25.06.2020.
//  Copyright © 2020 Yevhenii. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room

    @State private var zoomed = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation(.linear(duration: 2)) { self.zoomed.toggle() }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .navigationBarTitle(Text(room.name), displayMode: .inline)

            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all, 15)
                    .transition(.move(edge: .leading))
            }
        }
    }
}


struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView { RoomDetail(room: testData[0]) }
            NavigationView { RoomDetail(room: testData[1]) }
        }
    }
}
