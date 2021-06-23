//
//  RV+Admin.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 18/06/2021.
//

import Foundation

extension RealityView: BasicDelegateProtocol {
  func basicAction(type: BasicActionType) {
    switch type{
    case .disableFocus:
      anchor.isEnabled = false

    case .enableFocus:
      anchor.isEnabled = true

    case .showFocus:
      anchor.fadeSimpleMaterial(fadeIn: true)

    case .hideFocus:
      anchor.fadeSimpleMaterial(fadeIn: false)

    case .mockImport:
        importObject3dFromURL(object3dCodable: Object3DCodable())
    }

  }

  func showFocus() {
    //
    anchor.fadeSimpleMaterial(fadeIn: true)
    //anchor.show()
    print("Show Foucs")
  }

  func hideFocus() {
    //
    anchor.fadeSimpleMaterial(fadeIn: false)
   print("Hide Foucs")
  }
}
