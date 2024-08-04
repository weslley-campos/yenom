import SwiftUI

struct SidebarItemView: View {
    let iconName: String
    let isSelected: Bool
    let namespace: Namespace.ID
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                if(isSelected) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Colors.background : Colors.surface)
                        .stroke(isSelected ? Colors.primary : Colors.surface, lineWidth: 1)
                        .matchedGeometryEffect(id: "sidebarItem", in: namespace)
                }
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isSelected ? Colors.primary : Colors.onSurface)
            }
        }
        .buttonStyle(.plain)
        .frame(width: 56, height: 56)
        .padding(8)
    }
}

#Preview {
    VStack {
        @Namespace var preview
        
        SidebarItemView(
            iconName: "ic_home",
            isSelected: true,
            namespace: preview
        ) {
            
        }
        SidebarItemView(
            iconName: "ic_portfolio",
            isSelected: false,
            namespace: preview
        ){
            
        }
    }
}
