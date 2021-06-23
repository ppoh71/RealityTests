//
//  Object3dEntity.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 22/06/2021.
//

import Foundation
import ARKit
import SwiftUI
import RealityKit
import Combine

/// Custom Component (ecs)
struct Object3dComponent: RealityKit.Component {
  var object3d: Object3DCodable
}

/// We bundle the component in a protocol
/// that an entity can conform to, together with other methods for
/// animations or any other entity operation
protocol IsObject3d {
  var isObject3d: Object3dComponent { get set }
  var cancellable: Cancellable? { get set }
  var cancellables: [AnyCancellable] { get set }
}

/// Extension to connect the custom components in the protocolv
extension IsObject3d where Self: Entity {

  var object3d: Object3DCodable{
    get { self.isObject3d.object3d }
    mutating set { self.isObject3d.object3d = newValue }
  }
}

/// Methods to perform on a Focus Entity
extension IsObject3d where Self: Entity {
  
}
