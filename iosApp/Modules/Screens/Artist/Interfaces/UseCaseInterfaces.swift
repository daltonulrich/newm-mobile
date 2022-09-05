import Foundation
import SharedUI

struct ArtistViewUIModel {
	let trackSection: CellsSectionModel<CompactCellViewModel>
	let topSongsSection: CellsSectionModel<BigCellViewModel>
	let albumSection: CellsSectionModel<BigCellViewModel>
}

protocol ArtistViewUIModelProviding {
	func getModel() async throws -> ArtistViewUIModel
}
