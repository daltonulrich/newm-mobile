#if DEBUG
import Foundation
import SwiftUI
import ModuleLinker
import Resolver
import shared
import SharedUI

class MockArtistViewUIModelProviding: ArtistViewUIModelProviding {
	func getModel() async throws -> ArtistViewUIModel {
		Self.mockUIModel
	}
	
	static var mockUIModel: ArtistViewUIModel {
		ArtistViewUIModel(
			trackSection: CellsSectionModel<CompactCellViewModel>(cells: MockData.compactArtistCells, title: "LATEST TRACKS"),
			topSongsSection: CellsSectionModel<BigCellViewModel>(cells: MockData.bigArtistCells, title: "TOP SONGS"),
			albumSection: CellsSectionModel<BigCellViewModel>(cells: MockData.bigArtistCells, title: "ALBUMS")
		)
	}
}
#endif
