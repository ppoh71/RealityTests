//
//  FocusAnchorComponent.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 16/06/2021.
//

import Foundation
import ARKit
import SwiftUI
import RealityKit
import Combine

/// Custom Component (ecs)
struct FocusEntityComponent: RealityKit.Component {
  var id: String
  var opacity: Float = 0.7
  var mediaAsset: MediaAssetCodable?
}

/// We bundle the component in a protocol
/// that an entity can conform to, together with other methods for
/// animations or any other entity operation
protocol IsFocusEntity {
  var isFocusEntity: FocusEntityComponent { get set }
  var cancellable: Cancellable? { get set }
}

/// Extension to connect the custom components in the protocol
extension IsFocusEntity where Self: Entity {

  var id: String {
    self.isFocusEntity.id
  }

  var opacity: Float {
    get { self.isFocusEntity.opacity }
    mutating set { self.isFocusEntity.opacity = newValue }
  }

  var mediaAsset: MediaAssetCodable? {
    get { self.isFocusEntity.mediaAsset }
    mutating set { self.isFocusEntity.mediaAsset = newValue }
  }
}

/// Methods to perform on a Focus Entity
extension IsFocusEntity where Self: Entity {

  /// Flip the card to reveal the underside
  ///
  mutating func rotate() {

    self.opacity = 1

    var transform = self.transform
    transform.rotation = simd_quatf(angle: .pi, axis: [1, 0, 0])

    let myEvent = move(to: transform, relativeTo: parent, duration: 0.25, timingFunction: .easeOut)

    self.cancellable = self.scene?.subscribe(to: AnimationEvents.PlaybackTerminated.self, on: self, { (event) in
      guard event.playbackController == myEvent else { return }
      // completion?()
    })
  }

  /// Flip the card back to hide the underside
  ///
  mutating func hide() {
    var safeSelf = self

    var transform = self.transform
    transform.rotation = simd_quatf(angle: 0, axis: [1, 0, 0])
    let myEvent = move(to: transform, relativeTo: parent, duration: 0.25, timingFunction: .easeOut)

    self.cancellable = self.scene?.subscribe(to: AnimationEvents.PlaybackTerminated.self, on: self, { (event) in
      if (event.playbackController == myEvent) {
        safeSelf.cancellable = nil
        // completion?()
      }
    })
  }


  /// FadeIn/Out from a simple material.///
  /// Animated materials are not supported yet, so we loop
  /// opacity and set a new material to entity each cyle
  ///
  /// - Parameter fadeIn: fadeIn (true) or fadeout (false)
  mutating func fadeSimpleMaterial(fadeIn: Bool) {

    guard let color = self.mediaAsset?.color else {
      print("G. fade color")
      return
    }

    /// Define animation values for fade
    var delay: Double = 0
    let toValue: Float = fadeIn ? 1.1 : -0.1
    let by: Float  = fadeIn ? 0.05 : -0.05

    /// Loop opacity and apply new alpha material to entity
    stride(from: self.opacity, to: toValue, by: by).forEach { i in
      
      /// Set opacity for entity/model codable
      self.opacity += by
      delay += 0.01

      /// Recreate material with new alpha color from opacitry
      let color = Color(uiColor: UIColor.hexColor(hex: color , alpha: CGFloat(self.opacity)))
      let material = SimpleMaterial(color: SimpleMaterial.Color(color), isMetallic: true)

      /// Clean up stride func values -0.1 , 1.1
      self.opacity = self.opacity < 0 ? 0 : self.opacity
      self.opacity = self.opacity < 0 ? 0 : self.opacity

      /// perform the fade operation via material set directly on the entity
      self.entityFadeOutSimpleMaterial(material: material, delay: Double(delay))
    }
  }
}

