//
//  ContentView.swift
//  Rooms
//
//  Created by Yevhenii on 25.06.2020.
//  Copyright © 2020 Yevhenii. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = RoomStore()

    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle("Rooms")
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
        }
    }

    func addRoom() {
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }

    func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))

            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraSmall)

            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraSmall)
                .environment(\.colorScheme, .dark)
        }
    }
}
