import SwiftUI
import SharedUI
import Colors

struct TitleSection: View {
	private let model: HomeViewUIModel.TitleSectionModel
	
	init(model: HomeViewUIModel.TitleSectionModel) {
		self.model = model
	}
	
    var body: some View {
		HStack {
			title
			Spacer()
			profilePic
		}.padding([.leading, .trailing], sidePadding)
    }
	
	private var title: some View {
		let title = Text(model.title)
			.font(.ralewayExtraBold(ofSize: 32))
		if model.titleIsGreeting {
			return title.erased
		} else {
			return title.foregroundStyle(LinearGradient(colors: [Color(.newmLightBlue), Color(.newmPurple2)], startPoint: .bottomLeading, endPoint: .topTrailing)).erased
		}
	}
	
	private var profilePic: some View {
		AsyncImage(url: model.profilePicURL) { phase in
			switch phase {
			case .success(let image):
				image.circleImage(size: 44)
			default:
				Image.placeholder.circleImage(size: 44)
			}
		}
	}
}

struct TitleSection_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			TitleSection(model: MockHomeViewUseCase().execute().titleSectionModel)
			TitleSection(model: HomeViewUIModel.TitleSectionModel(titleIsGreeting: false, title: "HOME", profilePicURL: URL(string: "data:image/jpeg;base64,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")!))
		}.preferredColorScheme(.dark)
    }
}
