import SwiftUI
import ModuleLinker
import Resolver

protocol HomeScrollingCell: View where DataType: Identifiable {
	associatedtype DataType
	
	init(data: DataType)
}

struct HomeScrollingContentView<Model: HomeScrollingCell>: View {
	@Binding var selectedDataModel: Model.DataType?
	let dataModels: [Model.DataType]
	let title: String
	let spacing: CGFloat
	@Injected private var fontProvider: FontProviding
	
	var body: some View {
		VStack {
			sectionHeader(title: title)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .center, spacing: nil) {
					ForEach(dataModels) { data in
						Button(action: { selectedDataModel = data }) {
							Model(data: data)
								.padding(.trailing, spacing)
						}
					}
				}
				.padding(.leading)
			}
			.tint(.white)
		}
	}
	
	private func sectionHeader(title: String) -> some View {
		Text(title)
			.frame(maxWidth: .infinity, alignment: .leading)
			.foregroundColor(.white)
			.padding(.top)
			.padding(.leading)
			.font(fontProvider.newmFont(ofSize: 16))
	}
}

struct HomeScrollingContentView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			HomeScrollingContentView<ArtistCell>(selectedDataModel: .constant(nil), dataModels: Resolver.resolve(), title: "NEWM Artists", spacing: 8)
			HomeScrollingContentView<SongCell>(selectedDataModel: .constant(nil), dataModels: Resolver.resolve(), title: "NEWM Songs", spacing: 8)
			HomeScrollingContentView<PlaylistCell>(selectedDataModel: .constant(nil), dataModels: Resolver.resolve(), title: "Curated Playlists", spacing: 12)
		}
		.preferredColorScheme(.dark)
	}
}