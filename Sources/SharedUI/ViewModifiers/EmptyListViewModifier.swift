//
//  EmptyListViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/4/24.
//

import SwiftUI

struct EmptyListViewModifier<ActionView: View>: ViewModifier {
    let listEmpty: Bool
    let listType: EmptyListType
    let actionView: () -> ActionView
    
    func body(content: Content) -> some View {
        if listEmpty {
            VStack(spacing: 15) {
                Image(systemName: "tray")
                    .withFont(.title)
                Text(listType.title)
                    .withFont(.title, autoSizeLineLimit: 1)
                Text(listType.message)
                    .withFont(isDetail: true)
                    .multilineTextAlignment(.center)
                
                actionView()
            }
            .padding()
            .mainBackground(alignment: .center)
        } else {
            content
        }
    }
}

public extension View {
    func withEmptyListView(listEmpty: Bool, listType: EmptyListType) -> some View {
        modifier(EmptyListViewModifier(listEmpty: listEmpty, listType: listType, actionView: { EmptyView() }))
    }
    
    func withEmptyListView<ActionView: View>(listEmpty: Bool, listType: EmptyListType, @ViewBuilder actionView: @escaping () -> ActionView) -> some View {
        modifier(EmptyListViewModifier(listEmpty: listEmpty, listType: listType, actionView: actionView))
    }
}


// MARK: - Dependencies
public enum EmptyListType {
    case rooms
    case tasks
    case filteredTasks
    case createdHouses
    case searchedHouses
}

extension EmptyListType {
    var title: String {
        switch self {
        case .rooms:
            return "No Rooms"
        case .tasks:
            return "No Tasks"
        case .createdHouses:
            return "No Created Households"
        default:
            return "No Results"
        }
    }
    
    var message: String {
        switch self {
        case .rooms:
            return "Add a new room to begin reaping the benefits of iCleanMe."
        case .tasks:
            return "Add a new task to begin reaping the benefits of iCleanMe."
        case .filteredTasks:
            return "No existing tasks match the filter options you selected."
        case .createdHouses:
            return "It looks like you haven't created a house of your own yet. Navigate back to the 'House Select' view and tap 'Create' to start your own iCleanMe house!"
        case .searchedHouses:
            return "Capitalization matters. If you continue having trouble finding the house, ask the house creator for the exact name."
        }
    }
}

