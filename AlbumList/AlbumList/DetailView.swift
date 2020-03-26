//
//  DetailView.swift
//  AlbumList
//
//  Created by Nien Lam on 3/5/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var artist: Artist

    var body: some View {
        Text(artist.name)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
