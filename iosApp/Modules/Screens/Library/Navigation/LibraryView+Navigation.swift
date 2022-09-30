import Foundation
import SwiftUI
import Resolver
import ModuleLinker
import Artist
import SwiftUINavigation

extension LibraryView {
	struct Links: View {
		@Binding var route: LibraryRoute?
		@Injected private var playlistViewProvider: PlaylistViewProviding
		@Injected private var likedSongsViewProvider: LikedSongsViewProviding
		
		var body: some View {
			ZStack {
				NavigationLink(unwrapping: $route,
							   case: /LibraryRoute.playlist,
							   destination: { $playlistId in
					playlistViewProvider.playlistView(id: playlistId)
				}, onNavigate: clearLinks, label: {})
				NavigationLink(unwrapping: $route,
							   case: /LibraryRoute.likedSongs,
							   destination: { $likedSongsId in
					likedSongsViewProvider.likedSongsView(id: likedSongsId)
				}, onNavigate: clearLinks, label: {})
			}
		}
		
		private func clearLinks(isActive: Bool) {
			if isActive == false { route = nil }
		}
	}
}
