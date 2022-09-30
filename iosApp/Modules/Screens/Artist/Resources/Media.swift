import Foundation
import SwiftUI

enum SupFolIcon {
	case follow
	case support
	
	var image: Image {
		switch self {
		case .follow: return Image("Stars Icon")
		case .support: return Image("Stars Icon")
			//TODO: support should be heart.circle.fill, asset not added
		}
	}
}
