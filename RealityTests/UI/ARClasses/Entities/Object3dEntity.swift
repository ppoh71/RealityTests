//
//  Object3dEntity.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 22/06/2021.
//

import RealityKit
import Combine
import SwiftUI


/// This entity is used as focus when transforming, setting
/// basepoint, etc.
class Object3dEntity: Entity, HasModel, HasCollision, HasAnchoring, IsObject3d {

  /// Custom components embeded in a
  /// explicit protocol for FocusAnchor
  var isObject3d: Object3dComponent {
    get { components[Object3dComponent] ?? Object3dComponent(object3d: Object3DCodable()) }
    set { components[Object3dComponent] = newValue }
  }

  var cancellables: [AnyCancellable]
  var cancellable: Cancellable?

  init(object3d: Object3dComponent) {
    self.cancellables = [AnyCancellable]()

    super.init()

    /// init componet with object3d codable with is inside this component
    self.isObject3d = object3d

    /// Create simple color material
    self.generateCollisionShapes(recursive: true)
  }

  required init() {
    print("init() has not been implemented")
    self.cancellables = [AnyCancellable]()
  }
}
