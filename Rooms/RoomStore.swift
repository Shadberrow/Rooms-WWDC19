//
//  RoomStore.swift
//  Rooms
//
//  Created by Yevhenii on 26.06.2020.
//  Copyright © 2020 Yevhenii. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore: ObservableObject {
    @Published var rooms: [Room] = []

    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
}
