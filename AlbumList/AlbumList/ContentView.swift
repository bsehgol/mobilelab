//
//  ContentView.swift
//  AlbumList
//
//  Created by Nien Lam on 3/5/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI


struct Album {
    var name: String
    var image: String
    var artist: Artist
}

struct Artist {
    var name: String
    var bio: String
    var formed: Int
}


class AppModel: ObservableObject {
    var albums = [Album]()
    
    init() {
       let artist1 = Artist(name: "Neil Young", bio: "Born in Toronto", formed: 1945)
        let album1 = Album(name: "Lucky Thirteen", image: "neil", artist: artist1)
        albums.append(album1)

        let artist2 = Artist(name: "Muse", bio: "Born in NYC", formed: 1998)
        let album2 = Album(name: "The Resistence", image: "muse", artist: artist2)
        albums.append(album2)

        let artist3 = Artist(name: "Weezer", bio: "Born in SF", formed: 1999)
        let album3 = Album(name: "Weezer", image: "weezer", artist: artist3)
        albums.append(album3)

    }
}


struct AlbumCell: View {
    var album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(album.image)
                .resizable()
                .frame(width: 200, height: 200)
                .background(Color.red)
            
            VStack(alignment: .leading) {
                Text("\(album.name)")
                    .font(.system(size: 20, weight: .medium))
                Text("\(album.artist.name)")
                    .font(.system(size: 20, weight: .regular))
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var appModel = AppModel()
    
    @State var showModal = false

    @State var selectedAlbum: Album? = nil
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(appModel.albums, id: \.name) { album in
                        Button(action: {
                            self.selectedAlbum = album
                            
                            self.showModal.toggle()
                        }) {
                            AlbumCell(album: album)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .sheet(isPresented: self.$showModal) {
                        DetailView(artist: self.selectedAlbum!.artist)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
