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
}
            

class AppModel: ObservableObject {
    var albums = [Album]()
    
    init() {
        let artist1 = Artist(name: "Talk, Read and Sing to your baby", bio:"Begins to smile at people Turns head toward sounds Pays attention to faces")
        let album1 = Album(name: "2 Months", image: "twomonths", artist: artist1)
        albums.append(album1)

        let artist2 = Artist(name: "Play games such as peek-a-boo", bio: "Smiles spontaneously, especially at people. Reaches for toy with one hand. Holds head steady, unsupported")
        let album2 = Album(name: "4 Months", image: "4monthold", artist: artist2)
        albums.append(album2)

        let artist3 = Artist(name: "Read colorful picture books to your baby", bio:"Knows familiar faces and begins to know if someone is a stranger. Responds to sounds by making sounds. Looks around at things nearby")
        let album3 = Album(name: "6 Months", image: "6monthold", artist: artist3)
        albums.append(album3)
        
        let artist4 = Artist(name: "Play games with “my turn, your turn.", bio:"May be clingy with familiar adults. Understands “no”. Crawls")
        let album4 = Album(name: "9 Months", image: "9monthsold", artist: artist4)
        albums.append(album4)

        let artist5 = Artist(name: "Give your child push toys like a wagon or “kiddie push car.", bio:"Cries when mom or dad leaves Responds to simple spoken requests Starts to use things correctly; for example, drinks from a cup, brushes hair")
        let album5 = Album(name: "1 Year Old", image: "1yearold", artist: artist5)
        albums.append(album5)

        let artist6 = Artist(name: "Encourage pretend play", bio:"Likes to hand things to others as play Says several single words Walks alone")
        let album6 = Album(name: "18 Month Old", image: "18monthsold", artist: artist6)
        albums.append(album6)
//
//        let artist3 = Artist(name: "Weezer", bio:"")
//        let album3 = Album(name: "Weezer", image: "weezer", artist: artist3)
//        albums.append(album3)

    }
}


struct AlbumCell: View {
    var album: Album
    
    var body: some View {
        VStack() {
            Image(album.image)
                .resizable()
                .frame(width: 200, height: 200)
                .background(Color.red)
            
            VStack() {
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
