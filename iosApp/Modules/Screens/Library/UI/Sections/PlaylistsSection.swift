import SwiftUI
import Resolver
import SharedUI

public struct PlaylistsSection: View {
    
    private let model: CellsSectionModel<CompactCellViewModel>
    private let actionHandler: (String) -> ()
    
    public init(_ model: CellsSectionModel<CompactCellViewModel>, actionHandler: @escaping (String) -> ()) {
        self.model = model
        self.actionHandler = actionHandler
    }
    
    public var body: some View {
        
        LazyHGrid(rows: [
            GridItem(.fixed(60)),
            GridItem(.fixed(60)),
            GridItem(.fixed(60)),
            GridItem(.fixed(60))
        ], alignment: .top, spacing: 50) {
            ForEach(model.cells) { cellModel in
                CompactCell(model: cellModel, roundImage: true)
                    .frame(width: 180, alignment: .leading)
					.fixedSize()
                    .onTapGesture { actionHandler(cellModel.modelID) }
            }
        }
        .addHorizontalScrollView(title: model.title)
    }
}