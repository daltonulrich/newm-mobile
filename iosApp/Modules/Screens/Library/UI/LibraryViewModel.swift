import Foundation
import Combine
import Resolver
import ModuleLinker
import shared
import Utilities
import SharedUI
import Artist

class LibraryViewModel: ObservableObject {
	@MainActor @Published var state: ViewState<(LibraryViewUIModel, LibraryViewActionHandling)> = .loading
	@Published var route: LibraryRoute?
	
	@Injected private var uiModelProvider: LibraryViewUIModelProviding
	
	init() {
		Task {
			await refresh()
		}
	}
	
	@MainActor
	func refresh() async {
		do {
			state = .loading
			let uiModel = try await uiModelProvider.getModel()
			state = .loaded((uiModel, self))
		} catch {
			state = .error(error)
		}
	}
	
}

extension LibraryViewModel: LibraryViewActionHandling {
	func playlistTapped(id: String) {
		print(#function + " " + id)
		route = .playlist(id: id)
	}
	
	func artistTapped(id: String) {
		print(#function + " " + id)
		route = .artist(id: id)
	}
	
	func songTapped(id: String) {
		print(#function + " " + id)
		route = .songPlaying(id: id)
	}
}
