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

        let artist7 = Artist(name: "Hide your child’s toys around the room and let him find them.", bio:"Gets excited when with other children Points to things or pictures when they are named Builds towers of 4 or more blocks")
        let album7 = Album(name: "2 Year Old", image: "2yearold", artist: artist7)
        albums.append(album7)
        
        let artist8 = Artist(name: "Work with your child to solve the problem when he is upset.", bio:"Copies adults and friends Follows instructions with 2 or 3 steps Can work toys with buttons, levers, and moving parts")
        let album8 = Album(name: "3 Year Old", image: "3yearold", artist: artist8)
        albums.append(album8)
        
        let artist9 = Artist(name: "Teach your child to play outdoor games like tag, follow the leader, and duck, duck, goose.", bio:"Enjoys doing new things Sings a song or says a poem from memory such as the “Itsy Bitsy Spider” or the “Wheels on the Bus” Understands the idea of “same” and “different”")
        let album9 = Album(name: "4 Year Old", image: "4yearold", artist: artist9)
        albums.append(album9)
        
        let artist10 = Artist(name: "Help your child climb on the monkey bars.", bio:"Wants to be like friends Tells a simple story using full sentences Copies a triangle and other geometric shapes")
        let album10 = Album(name: "5 Year Old", image: "5yearold", artist: artist10)
        albums.append(album10)

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
