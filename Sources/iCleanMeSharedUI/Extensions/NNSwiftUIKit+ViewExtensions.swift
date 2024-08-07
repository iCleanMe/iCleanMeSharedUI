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
    var isSmallPhone: Bool {
        return UIScreen.main.bounds.size.height < 650.0
    }
    
    func getTopController() -> UIViewController? {
        return UIApplication.shared.getTopViewController()
    }
    
    func onShake(isActive: Bool, action: @escaping () -> Void) -> some View {
        nnOnShake(isActive: isActive, action: action)
    }
    
    func withNavBarDismissButton(isActive: Bool = true, placement: ToolbarItemPlacement? = nil, textColor: Color = .white, dismissType: NavBarDismissType = .xmark, accessibilityId: String? = nil, dismiss: (() -> Void)? = nil) -> some View {
        nnWithNavBarDismissButton(isActive: isActive, placement: placement, textColor: textColor, dismissType: dismissType, accessibilityId: accessibilityId, dismiss: dismiss)
    }
    
    func withNavBarButton(placement: ToolbarItemPlacement = .navigationBarTrailing, buttonContent: NavBarButtonContent, font: Font = .title2, textColor: Color = .primary, accessibilityId: String? = nil, action: @escaping () -> Void) -> some View {
        nnWithNavBarButton(placement: placement, buttonContent: buttonContent, font: font, textColor: textColor, accessibilityId: accessibilityId, action: action)
    }
    
    func withDiscardChangesDismissButton<Item: Equatable>(itemToModify: Item, accessibilityId: String? = nil, dismissButtonInfo: AccessibleItem? = nil) -> some View {
        nnWithDiscardChangesNavBarDismissButton(itemToModify: itemToModify, accessibilityId: accessibilityId, dismissButtonInfo: dismissButtonInfo)
    }
    
    func showcased(_ title: String, order: Int, cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous, scale: CGFloat = 1) -> some View {
        nnShowcased(title, order: order, cornerRadius: cornerRadius, style: style, scale: scale)
    }
    
    func canShowcaseViews(showHighlights: Bool, onFinished: @escaping () -> Void) -> some View {
        nnCanShowcaseViews(showHighlights: showHighlights, onFinished: onFinished)
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
    
    func asyncConfirmation(showingConfirmation: Binding<Bool>, role: ButtonRole? = nil, buttonInfo: AccessibleItem, message: String, textCase: Text.Case? = nil, action: @escaping () async throws -> Void) -> some View {
        nnAsyncConfirmation(showingConfirmation: showingConfirmation, role: role, buttonInfo: buttonInfo, message: message, action: action)
            .textCase(textCase)
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
    
    func withSwipeDelete(_ message: String = "Are you sure you want to delete this item?", isActive: Bool = true, alertButtonInfo: AccessibleItem? = nil, delete: @escaping () async throws -> Void) -> some View  {
        nnWithSwipeDelete(message: message, isActive: isActive, alertButtonInfo: alertButtonInfo, delete: delete)
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
    func fieldAlert(_ message: String, isPresented: Binding<Bool>, fieldInfo: AccessibleItem, buttonText: String = "Save", cancelText: String = "Cancel", action: @escaping (String) async throws -> Void) -> some View {
        nnFieldAlert(message, isPresented: isPresented, fieldInfo: fieldInfo, action: action)
    }
    
    func doubleFieldAlert(_ message: String, isPresented: Binding<Bool>, firstFieldInfo: AccessibleItem, secondFieldInfo: AccessibleItem, buttonInfo: AccessibleItem? = nil, cancelInfo: AccessibleItem? = nil, action: @escaping (String, String) async throws -> Void) -> some View {
        nnDoubleFieldAlert(message, isPresented: isPresented, firstFieldInfo: firstFieldInfo, secondFieldInfo: secondFieldInfo, buttonInfo: buttonInfo, cancelInfo: cancelInfo, action: action)
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
    
    func withSwipeAction(info: AccessibleItem, systemImage: String? = nil, tint: Color, edge: HorizontalEdge? = nil, isActive: Bool = true, action: @escaping () -> Void) -> some View {
        nnWithSwipeAction(info: info, systemImage: systemImage, tint: tint, edge: edge, isActive: isActive, action: action)
    }
}
