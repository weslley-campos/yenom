import SwiftUI

struct SidebarView: View {
    @Binding var selected: String
    @Namespace private var sidebarAnimation
    
    private let sideBarIcons = {
        [.home, .portfolio, .transactions, .settings, .logout] as [Icons]
    }().map { icon in
        icon.rawValue
    }
    
    var body: some View {
        VStack {
            ForEach(0...(sideBarIcons.count - 2), id: \.self) { index in
                SidebarItemView(
                    iconName: sideBarIcons[index],
                    isSelected: selected == sideBarIcons[index],
                    namespace: sidebarAnimation
                ){
                    withAnimation(.spring) {
                        selected = sideBarIcons[index]
                    }
                }
            }
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            SidebarItemView(
                iconName: sideBarIcons.last!,
                isSelected: selected == sideBarIcons.last!,
                namespace: sidebarAnimation
            ) {
                withAnimation(.spring) {
                    selected = sideBarIcons.last!
                }
            }
        }
        .background(Colors.surface)
    }
}

private struct SidebarViewPreview: View {
    @State var selected = Icons.home.rawValue
    
    var body: some View {
        SidebarView(selected: $selected)
    }
}

#Preview {
   SidebarViewPreview()
}

