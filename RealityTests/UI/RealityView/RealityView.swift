//
//  RealityView.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 16/06/2021.
//

import ARKit
import Combine
import SwiftUI
import RealityKit

class RealityView: ARView {

  // MARK: Init

  init(frame: CGRect, observer: ObserverUI) {
    self.observer = observer
    super.init(frame: frame)
  }

  required init?(coder decoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  required init(frame frameRect: CGRect) {
    fatalError("init(frame:) has not been implemented")
  }

  // MARK:

  ///  Main AR View
  var arView: ARView { return self }

 

  /// SwiftUI observable object
  let observer: ObserverUI

  var cancellables = [AnyCancellable]()

  /// Basic Entities
  var anchor = FocusEntity()

  lazy var object3dAnchor: AnchorEntity = {
    let object3dAnchor = AnchorEntity(world: .zero)
    scene.addAnchor(object3dAnchor)
    return object3dAnchor
  }()
}
