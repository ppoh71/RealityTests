//
//  EntityExtension.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 21/06/2021.
//

import RealityKit
import Combine
import SwiftUI

extension Entity {

  /// Perform a material update on the Entity with given material.
  /// This is used for the fade out and fade in function.
  /// performing this updates in a node extention is somehow faster
  /// than updating from a entity protocol. Nevertheless this method is usually
  /// called from an entiy protocol method.
  ///
  ///
  /// - Parameters:
  ///   - material: Material Component
  ///   - step: Animation timer steps
  func entityFadeOutSimpleMaterial(material: SimpleMaterial, delay: Double) {

    guard var model = self.components[ModelComponent.self] as? ModelComponent else {return}

    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
      print("add material ..")
      model.materials = [material]
      self.components[ModelComponent.self] = model
    }
  }

}
