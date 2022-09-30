import SwiftUI
import UIKit

struct HeaderImageSection: View {
	private let model: HeaderImageCellModel
	
	init(_ model: HeaderImageCellModel) {
		self.model = model
	}
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				if geometry.frame(in: .global).minY <= UIScreen.main.bounds.size.height/10 {
					Image("\(model.headerImage)")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: geometry.size.width, height: geometry.size.height)
						.offset(y: geometry.frame(in: .global).minY/9)
						.padding(.top, UIScreen.main.bounds.size.height/10)
						.clipped()
				} else {
					Image("\(model.headerImage)")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
						.clipped()
						.padding(.top, UIScreen.main.bounds.size.height/10)
						.offset(y: -geometry.frame(in: .global).minY)
				}
			}
		}
		.frame(height: 20)
	}
}

struct HeaderImageSection_Previews: PreviewProvider {
	static var previews: some View {
		HeaderImageSection(HeaderImageCellModel(headerImage: "bowie"))
	}
}
