//
//  FocusAnchor.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 16/06/2021.
//

import RealityKit
import Combine
import SwiftUI


/// This entity is used as focus when transforming, setting
/// basepoint, etc.
class FocusEntity: Entity, HasModel, HasCollision, HasAnchoring, IsFocusEntity {

  /// Custom components embeded in a
  /// explicit protocol for FocusAnchor
  var isFocusEntity: FocusEntityComponent {
    get { components[FocusEntityComponent] ?? FocusEntityComponent(id: "FocusEntity") }
    set { components[FocusEntityComponent] = newValue }
  }

  var cancellable: Cancellable?

  required init() {
    super.init()

    /// init with color material
    let mediaAsset = MediaAssetCodable(colorString: "#ffffff")
    self.isFocusEntity = FocusEntityComponent(id: "FocusEntity", mediaAsset: mediaAsset)

    /// Create simple color material
    let color = Color(uiColor: UIColor.hexColor(hex: self.isFocusEntity.mediaAsset?.color ?? "#ffffff" , alpha: CGFloat(self.isFocusEntity.opacity)))
    let simpleColorMaterial = SimpleMaterial.Color(color)

    /// add to model component
    self.model = ModelComponent(
      mesh: .generateBox(width: 0.2, height: 0.01, depth: 0.2),
      materials: [SimpleMaterial(color: simpleColorMaterial, isMetallic: true)]
    )

    self.generateCollisionShapes(recursive: true)
  }
}





