//
//  PlaylistCell.swift
//  iosApp
//
//  Created by Marty Ulrich on 1/11/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct PlaylistCell: View {
	struct Playlist: Identifiable {
		let image: UIImage
		let title: String
		let creator: String
		let songCount: Int
		let playlistID: String
		var id: ObjectIdentifier { playlistID.objectIdentifier }
	}

	let data: Playlist
	
    var body: some View {
		VStack {
			CircleImage(image: data.image, size: 60)
				.padding(.top, 5)
			Text(data.title)
				.multilineTextAlignment(.center)
				.foregroundColor(.white)
				.font(.caption)
				.padding(.bottom, 2)
				.lineLimit(2)
				.minimumScaleFactor(0.5)
			Text("by \(data.creator)")
				.foregroundColor(.purple)
				.font(.caption3)
				.padding(.bottom, 2)
			Text("♬ \(data.songCount)")
				.foregroundColor(.white)
				.font(.caption4)
				.padding(.bottom, 4)
		}
		.frame(width: 75, height: 150, alignment: .top)
		.padding(10)
		.background(LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom))
		.cornerRadius(60)
    }
}

extension PlaylistCell: HomeScrollingCellModel {
	typealias DataType = PlaylistCell.Playlist
}

struct PlaylistCell_Previews: PreviewProvider {
    static var previews: some View {
		PlaylistCell(data: DummyData.makePlaylist(id: "1"))
    }
}