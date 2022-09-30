import SwiftUI
import ModuleLinker
import Resolver


struct ArtistView: View {
	@StateObject private var viewModel = ArtistViewModel()
	@Environment(\.presentationMode) var presentationMode
	
	public var body: some View {
		NavigationView {
			switch viewModel.state {
			case .loading:
				ProgressView()
			case .loaded(let (uiModel, actionHandler)):
				LoadedView(actionHandler: actionHandler, uiModel: uiModel, route: $viewModel.route)
			case .error:
				Text("Error")
			}
		}
		.navigationTitle("J-ROC")
		.navigationBarBackButtonHidden()
		.navigationBarItems(leading:
			Button(action: {
				self.presentationMode.wrappedValue.dismiss()
			}) {
				HStack {
					Image("Back Button")
				}
		},
		trailing:
			Button(action: {
			print("extra actions")
		}) {
			Image(systemName: "ellipsis")
				.rotationEffect(Angle(degrees: 90))
				.foregroundColor(.white)
		})
		.navigationAppearance(backgroundColor: .black)
	}
}

struct ArtistView_Previews: PreviewProvider {
	static var previews: some View {
		return ArtistView()
	}
}


struct NavAppearanceModifier: ViewModifier {
	init(backgroundColor: UIColor) {
		let navBarAppearance = UINavigationBarAppearance()
		navBarAppearance.configureWithOpaqueBackground()
		navBarAppearance.backgroundColor = backgroundColor
		UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
	}
	
	func body(content: Content) -> some View {
		content
	}
}

extension View {
	func navigationAppearance(backgroundColor: UIColor) -> some View {
		self.modifier(NavAppearanceModifier(backgroundColor: backgroundColor))
	}
}
