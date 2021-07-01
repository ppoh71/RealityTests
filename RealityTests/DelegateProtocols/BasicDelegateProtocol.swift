//
//  AdminDelegates.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 17/06/2021.
//

import Foundation

enum BasicActionType {
  case disableFocus
  case enableFocus
  case showFocus
  case hideFocus
  case mockImport
}

protocol BasicDelegateProtocol: AnyObject {
  func basicAction(type: BasicActionType)
  func showFocus()
  func hideFocus()
}
