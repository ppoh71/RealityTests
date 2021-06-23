//
//  RV+Object3dImport.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 22/06/2021.
//

import ARKit
import Combine
//import SwiftUI
import RealityKit
import AuthenticationServices

extension RealityView {

  func importObject3dFromURL(object3dCodable: Object3DCodable) {
      print("Import mock ... entity")

    _ = Entity.loadAsync(named: "Resources/fish_clown/fish_clown").sink(
      receiveCompletion: { loadCompletion in

      print("loadCompletion \(loadCompletion)")

      // Added this switch just as an example
      switch loadCompletion {
      case .failure(let loadErr):
        print(loadErr)
      case .finished:
        print("entity loaded without errors")
      }
    }, receiveValue: { entity in
      // do something with entity
      print("Received ... entity")
      self.addObject3dToReality(entity: entity, object3dCodable: object3dCodable)
    }
    )
  }


  /// Add the Object3d Entity to Reality View
  /// and add to store
  func addObject3dToReality(entity: Entity, object3dCodable: Object3DCodable) {
    print("Add ... entity")

    /// Add Object 3d Components
    /// with object3dCodable from fb
    entity.components[Object3dComponent.self] = Object3dComponent(object3d: object3dCodable)

    /// add to anchor
    self.object3dAnchor.addChild(entity)
  }


}
