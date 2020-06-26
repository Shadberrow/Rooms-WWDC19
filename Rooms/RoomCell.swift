//
//  RoomCell.swift
//  Rooms
//
//  Created by Yevhenii on 26.06.2020.
//  Copyright © 2020 Yevhenii. All rights reserved.
//

import SwiftUI

struct RoomCell: View {
    let room: Room

    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 0.0) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
