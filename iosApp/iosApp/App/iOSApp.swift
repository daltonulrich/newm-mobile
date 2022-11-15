import SwiftUI
import UIKit
import Resolver
import ModuleLinker

@main
struct iOSApp: App {
	var mainViewProvider: MainViewProviding
	
	init() {
		UINavigationBar.appearance().tintColor = .white
#if DEBUG
		UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
#endif
		let appearance = UINavigationBarAppearance()
		
		appearance.configureWithOpaqueBackground()
		
		let backItemAppearance = UIBarButtonItemAppearance()
		backItemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.clear] // fix text color
		appearance.backButtonAppearance = backItemAppearance
		
		let backImage = UIImage(named: "Back Button")?.withTintColor(.white, renderingMode: .alwaysOriginal)
//		let ellipsisImage = UIImage(named: "Ellipsis")?.withTintColor(.white, renderingMode: .alwaysOriginal)

		appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
		
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().scrollEdgeAppearance = appearance
		UINavigationBar.appearance().compactAppearance = appearance
		UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
		
//		let navBarAppearance = UINavigationBarAppearance()
//		navBarAppearance.configureWithOpaqueBackground()
//		navBarAppearance.backgroundColor = .black
//		UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//		UINavigationBar.appearance().isTranslucent = false
//		UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).backIndicatorImage =
//		UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIToolbar.self]).image = UIImage(contentsOfFile: "Back Button")
		mainViewProvider = Resolver.resolve()
	}
	
	var body: some Scene {
		WindowGroup {
			mainViewProvider.mainView()
		}
	}
}
