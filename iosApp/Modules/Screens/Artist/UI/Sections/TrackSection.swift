import SwiftUI
import Resolver
import SharedUI

public struct TrackSection: View {
	@State var range: Range<Int> = 0..<4
	
	private let model: CellsSectionModel<CompactCellViewModel>
	private let actionHandler: (String) -> ()
	
	public init(_ model: CellsSectionModel<CompactCellViewModel>, actionHandler: @escaping (String) -> ()) {
		self.model = model
		self.actionHandler = actionHandler
	}
	
	public var body: some View {
		LazyVStack(alignment: .leading) {
			ForEach(model.cells.prefix(4)) { cellModel in
				//TODO: when (roundImage = false) isnt setting size incorrectly, set roundImage: false 
				CompactCell(model: cellModel, roundImage: true)
					.frame(width: 180, alignment: .leading)
					.fixedSize()
					.onTapGesture { actionHandler(cellModel.modelID) }
			}
		}
		.padding([.leading, .trailing], sidePadding)
		.addSectionTitle(model.title)
	}
}

struct TrackSection_Previews: PreviewProvider {
	static var previews: some View {
		TrackSection(CellsSectionModel(cells: SharedUI.MockData.compactArtistCells, title: "NEWM ARTISTS"), actionHandler: {_ in})
			.preferredColorScheme(.dark)
	}
}
