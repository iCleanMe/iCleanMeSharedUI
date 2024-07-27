//
//  NNSwiftUIKit+ViewExtensions.swift
//  
//
//  Created by Nikolai Nobadi on 6/14/24.
//

import SwiftUI
import NnSwiftUIKit

public protocol DisplayableError: NnDisplayableError {}
public extension DisplayableError {
    var title: String {
        return "Error"
    }
}

#if canImport(UIKit)
public extension View {
    var isSmallPhone: Bool { UIScreen.main.bounds.size.height < 650.0 }
    
    func getTopController() -> UIViewController? {
        return UIApplication.shared.getTopViewController()
    }
    
    func onShake(isActive: Bool, action: @escaping () -> Void) -> some View {
        nnOnShake(isActive: isActive, action: action)
    }
    
    func withNavBarDismissButton(isActive: Bool = true, placement: ToolbarItemPlacement? = nil, textColor: Color = .white, dismissType: NavBarDismissType = .xmark, dismiss: (() -> Void)? = nil) -> some View {
        nnWithNavBarDismissButton(isActive: isActive, placement: placement, textColor: textColor, dismissType: dismissType, dismiss: dismiss)
    }
    
    func withNavBarButton(placement: ToolbarItemPlacement = .navigationBarTrailing, buttonContent: NavBarButtonContent, font: Font = .title2, textColor: Color = .primary, action: @escaping () -> Void) -> some View {
        nnWithNavBarButton(placement: placement, buttonContent: buttonContent, font: font, textColor: textColor, action: action)
    }
    
    func withDiscardChangesDismissButton<Item: Equatable>(itemToModify: Item) -> some View {
        nnWithDiscardChangesNavBarDismissButton(itemToModify: itemToModify)
    }
    
    func showcased(_ title: String, order: Int, cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous, scale: CGFloat = 1) -> some View {
        self.nnShowcased(title, order: order, cornerRadius: cornerRadius, style: style, scale: scale)
    }
    
    func canShowcaseViews(showHighlights: Bool, onFinished: @escaping () -> Void) -> some View {
        self.nnCanShowcaseViews(showHighlights: showHighlights, onFinished: onFinished)
    }
}
#endif


public extension View {
    func getWidthPercent(_ percent: CGFloat) -> CGFloat {
        return nnGetWidthPercent(percent)
    }
    
    func getHeightPercent(_ percent: CGFloat) -> CGFloat {
        return nnGetHeightPercent(percent)
    }
}


// MARK: - Error Handling
public extension View {
    func withErrorHandling() -> some View {
        nnWithNnLoadingView()
            .nnWithNnErrorHandling()
    }
    
    func sheetWithErrorHandling<Item: Identifiable, Sheet: View>(item: Binding<Item?>, isDisabled: Bool = false, @ViewBuilder sheet: @escaping (Item) -> Sheet) -> some View {
        nnSheetWithErrorHandling(item: item, isDisabled: isDisabled, sheet: sheet)
    }
    
    func sheetWithErrorHandling<Sheet: View>(isPresented: Binding<Bool>, @ViewBuilder sheet: @escaping () -> Sheet) -> some View {
        nnSheetWithErrorHandling(isPresented: isPresented, sheet: sheet)
    }
    
    func asyncOnChange<Item: Equatable>(of item: Item?, hideLoadingIndicator: Bool = false, action: @escaping (Item) async throws -> Void) -> some View {
        nnAsyncOnChange(of: item, hideLoadingIndicator: hideLoadingIndicator, action: action)
    }
    
    func asyncHandleURL(hideLoadingIndicator: Bool = false, asyncAction: @escaping (URL) async throws -> Void) -> some View {
        nnAsyncHandleURL(hideLoadingIndicator: hideLoadingIndicator, asyncAction: asyncAction)
    }
    
    func asyncConfirmation(showingConfirmation: Binding<Bool>, role: ButtonRole? = nil, buttonText: String, message: String, action: @escaping () async throws -> Void) -> some View {
        nnAsyncConfirmation(showingConfirmation: showingConfirmation, role: role, buttonText: buttonText, message: message, action: action)
            .textCase(nil)
    }
    
    func asyncTask(delay: Double = 0, hideLoadingIndicator: Bool = false, asyncAction: @escaping () async throws -> Void) -> some View {
        nnAsyncTask(delay: delay, hideLoadingIndicator: hideLoadingIndicator, asyncAction: asyncAction)
    }
    
    func asyncTapGesture(asRowItem: NnAsyncTapRowItem? = nil, action: @escaping () async throws -> Void) -> some View {
        nnAsyncTapGesture(asRowItem: asRowItem, action: action)
    }
    
    func asyncOnSubmit(submitLabel: SubmitLabel = .done, action: @escaping () async throws -> Void) -> some View {
        nnAsyncOnSubmit(submitLabel: submitLabel, action: action)
    }
}


// MARK: - Conditionals
public extension View {
    func onlyShow(when conditional: Bool) -> some View {
        nnOnlyShow(when: conditional)
    }
 
    func asNavLink<D: Hashable>(_ data: D, isActive: Bool = true) -> some View {
        nnAsNavLink(data, isActive: isActive)
    }
    
    func withSwipeDelete(_ message: String = "Are you sure you want to delete this item?", isActive: Bool = true, buttonImage: String = "trash", deleteText: String = "Delete", delete: @escaping () async throws -> Void) -> some View  {
        nnWithSwipeDelete(message: message, isActive: isActive, buttonImage: buttonImage, deleteText: deleteText, delete: delete)
    }
}


// MARK: - Design
public extension View {
    func asRowItem(withChevron: Bool = false) -> some View {
        nnAsRowItem(withChevron: withChevron)
    }
    
    func withFont(_ style: Font.TextStyle = .body, isDetail: Bool = false, textColor: Color = .primary, autoSizeLineLimit lineLimit: Int? = nil) -> some View {
        self.lineLimit(lineLimit)
            .nnSetCustomFont(style, fontName: isDetail ? "HelveticaNeue" : "HelveticaNeue-Bold", textColor: textColor, autoSize: lineLimit != nil)
    }
    
    func gradientText(_ gradientType: GradientType = .seaNightText) -> some View {
        nnTextLinearGradient(gradientType.gradient)
    }
    
    func withGradientBackground(_ gradientType: GradientType, opacity: CGFloat = 1) -> some View {
        nnLinearGradientBackground(gradientType.gradient, opacity: opacity)
    }
}


// MARK: - Alerts
public extension View {
    func fieldAlert(_ message: String, isPresented: Binding<Bool>, fieldPrompt: String, buttonText: String = "Save", cancelText: String = "Cancel", action: @escaping (String) async throws -> Void) -> some View {
        nnFieldAlert(message, isPresented: isPresented, fieldPrompt: fieldPrompt, buttonText: buttonText, cancelText: cancelText, action: action)
    }
    
    func doubleFieldAlert(_ message: String, isPresented: Binding<Bool>, firstFieldPrompt: String, secondFieldPrompt: String, buttonText: String = "Save", cancelText: String = "Cancel", action: @escaping (String, String) async throws -> Void) -> some View {
        nnDoubleFieldAlert(message, isPresented: isPresented, firstFieldPrompt: firstFieldPrompt, secondFieldPrompt: secondFieldPrompt, action: action)
    }
}


// MARK: - Utility
public extension View {
    func delayedOnAppear(seconds: Double, perform action: @escaping () -> Void) -> some View {
        nnDelayedOnAppear(seconds: seconds, perform: action)
    }

    func tappable(tapIsActive: Bool = true, withChevron: Bool = false, tint: Color = .white, onTapGesture: @escaping () -> Void) -> some View {
        nnTappable(tapIsActive: tapIsActive, withChevron: withChevron, tint: tint, onTapGesture: onTapGesture)
    }
    
    func withSwipeAction(_ title: String, image: String? = nil, tint: Color, edge: HorizontalEdge = .trailing, isActive: Bool = true, action: @escaping () -> Void) -> some View {
        nnWithSwipeAction(title, imageName: image, tint: tint, edge: edge, isActive: isActive, action: action)
    }
}
