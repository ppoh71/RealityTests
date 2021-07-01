//
//  Extensions.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 21/06/2021.
//

import Foundation
import UIKit
import ARKit
import SwiftUI

// MARK: - float4x4 extensions

extension Data
{
  func printJSON()
  {
    if let JSONString = String(data: self, encoding: String.Encoding.utf8)
    {
      print(JSONString)
    }
  }
}

extension float4x4 {
  /**
   Treats matrix as a (right-hand column-major convention) transform matrix
   and factors out the translation component of the transform.
   */
  var translation: SIMD3<Float> {
    get {
      let translation = columns.3
      return [translation.x, translation.y, translation.z]
    }
    set(newValue) {
      columns.3 = [newValue.x, newValue.y, newValue.z, columns.3.w]
    }
  }

  /**
   Factors out the orientation component of the transform.
   */
  var orientation: simd_quatf {
    return simd_quaternion(self)
  }

  /**
   Creates a transform matrix with a uniform scale factor in all directions.
   */
  init(uniformScale scale: Float) {
    self = matrix_identity_float4x4
    columns.0.x = scale
    columns.1.y = scale
    columns.2.z = scale
  }
}

// MARK: Extension Int
extension Int {
  func deegreesToRadiants() -> CGFloat {
    return CGFloat(self) * CGFloat.pi / 180.0
  }

  func formatNumbers() -> String {
    let numFormatter = NumberFormatter()

    typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
    let abbreviations:[Abbrevation] = [(0, 1, ""),
                                       (1000.0, 1000.0, "K"),
                                       (100_000.0, 1_000_000.0, "M"),
                                       (100_000_000.0, 1_000_000_000.0, "B")]
    // you can add more !

    let startValue = Double (abs(self))
    let abbreviation:Abbrevation = {
      var prevAbbreviation = abbreviations[0]
      for tmpAbbreviation in abbreviations {
        if (startValue < tmpAbbreviation.threshold) {
          break
        }
        prevAbbreviation = tmpAbbreviation
      }
      return prevAbbreviation
    } ()

    let value = Double(self) / abbreviation.divisor
    numFormatter.positiveSuffix = abbreviation.suffix
    numFormatter.negativeSuffix = abbreviation.suffix
    numFormatter.allowsFloats = true
    numFormatter.minimumIntegerDigits = 1
    numFormatter.minimumFractionDigits = 0
    numFormatter.maximumFractionDigits = 1

    return numFormatter.string(from: NSNumber (value:value))!
  }
}

// MARK: Extension Double
extension Double {
  func roundToPlaces(places:Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }
}

// MARK: Extension Float
extension Float {
  func roundToPlaces(places:Int) -> Float {
    let divisor = pow(10.0, Float(places))
    return (self * divisor).rounded() / divisor
  }

}

extension CGFloat {
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}

// MARK: Extension UIImage
extension UIImage {

  /// aspectRation w/h
  /// - Returns: aspectratio
  func aspectRatio() -> Float {
    return Float(self.size.width / self.size.height)
  }


  /// Compare 2 UIImage Objects
  /// - Parameter image: uiimage to compare
  /// - Returns: bool
  func isEqualToImage(image: UIImage) -> Bool {
    if let data1: NSData = self.pngData() as NSData?, let data2: NSData = image.pngData()! as NSData? {
      return data1.isEqual(data2)
    } else {
      return false
    }
  }

  func rotate(byDegrees degree: Double) -> UIImage? {
    let radians = CGFloat(degree * .pi) / 180.0 as CGFloat
    let rotatedSize = self.size
    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(rotatedSize, false, scale)
    let bitmap = UIGraphicsGetCurrentContext()
    bitmap?.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
    bitmap?.rotate(by: radians)
    bitmap?.scaleBy(x: 1.0, y: -1.0)
    bitmap?.draw(
      self.cgImage!,
      in: CGRect.init(x: -self.size.width / 2, y: -self.size.height / 2 , width: self.size.width, height: self.size.height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext() // this is needed
    return newImage!
  }

}

// MARK: Extension String
extension String {
  func trunc(length: Int, trailing: String = "…") -> String {
    if (self.count <= length) {
      return self
    }

    let truncated = self.prefix(length)
    while truncated.last != " " {

      /// when string has no " " space, the loop doesnt know when to stop
      guard truncated.count > length else {
        break
      }
    }
    return truncated + trailing
  }

  func fileNameRaw() -> String {
    return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
  }

  func fileExtension() -> String {
    return NSURL(fileURLWithPath: self).pathExtension ?? ""
  }

  func getStringRange(offsetStart: Int, OffsetEnd: Int) -> String {
    let start = self.index(self.startIndex, offsetBy: offsetStart)
    let end = self.index(self.endIndex, offsetBy: OffsetEnd)
    return String(self[start..<end])
  }

  func isValidEmail() -> Bool {
    let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,8}$"
    let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }

  func isValidAutoId() -> Bool {
    return range(of:"^[a-zA-Z0-9-]{1,}$", options: .regularExpression) != nil
  }

  subscript(_ range: CountableRange<Int>) -> String {
    let start = index(startIndex, offsetBy: max(0, range.lowerBound))
    let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                         range.upperBound - range.lowerBound))
    return String(self[start..<end])
  }

  subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
    let start = index(startIndex, offsetBy: max(0, range.lowerBound))
    return String(self[start...])
  }

  func printDate() -> String {
    let formatter4 = DateFormatter()
    formatter4.dateFormat = "yyyy-MM-dd hh:mm:ss"
    return ( formatter4.date(from: self)?.toShortDate() ?? "...")
  }

  func fromBase64() -> String? {
    guard let data = Data(base64Encoded: self) else {
      return nil
    }
    return String(data: data, encoding: .utf8)
  }

  func toBase64() -> String {
    return Data(self.utf8).base64EncodedString()
  }

  func reformatWithNewLineFromFirebase() -> String {
    return self.replacingOccurrences(of: "_n", with: "\n")
  }

  func deleteHTMLTag(tag:String) -> String {
    return self.replacingOccurrences(of: "(?i)</?\(tag)\\b[^<]*>", with: "", options: .regularExpression, range: nil)
  }

  func deleteHTMLTags() -> String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
  }
}

// MARK: Extension Date
extension Date {
  func toString() -> String {
    let dateFormatter = DateFormatter()
    let format = ("yyyy-MM-dd hh:mm:ss")
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }

  func toShortDate() -> String {
    let dateFormatter = DateFormatter()
    let format = ("d. MMM y")
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
}

// MARK: Extension Filemanager
extension FileManager {
  class func documentsDir() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]
    return paths[0]
  }

  class func cachesDir() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
    return paths[0]
  }
}

// MARK: Extension URL
extension URL {
  var attributes: [FileAttributeKey : Any]? {
    do {
      return try FileManager.default.attributesOfItem(atPath: path)
    } catch let error as NSError {
      print("FileAttribute error: \(error)")
    }
    return nil
  }

  var fileSize: UInt64 {
    return attributes?[.size] as? UInt64 ?? UInt64(0)
  }

  var fileSizeString: String {
    return ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
  }

  var creationDate: Date? {
    return attributes?[.creationDate] as? Date
  }

  var modificationDate: Date? {
    return attributes?[.modificationDate] as? Date
  }

  var fileExists: Bool {
    let path = self.path
    if (FileManager.default.fileExists(atPath: path))   {
      return true
    }else        {
      return false;
    }
  }
}

// MARK: Extension Date
extension Date {
  func timestamp() -> Int {
    return Int(self.timeIntervalSince1970 * 1000)
  }
}

// MARK: Extension UIColor
extension UIColor {
  var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    getRed(&red, green: &green, blue: &blue, alpha: &alpha)

    return (red, green, blue, alpha)
  }

  func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
    return UIGraphicsImageRenderer(size: size).image { rendererContext in
      self.setFill()
      rendererContext.fill(CGRect(origin: .zero, size: size))
    }
  }

  static func random(alpha:CGFloat = 1) -> UIColor {
    return UIColor(red:   .random(),
                   green: .random(),
                   blue:  .random(),
                   alpha: alpha)
  }


  static func hexColor (hex:String, alpha: CGFloat) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
      return UIColor.green
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(alpha)
    )
  }
}


// MARK: Array
extension Array {
  func chunked(into size: Int) -> [[Element]] {
    guard self.count > 0 else {
      print("G. chunk")
      return [[Element]]()
    }

    return stride(from: 0, to: count, by: size).map {
      Array(self[$0 ..< Swift.min($0 + size, count)])
    }
  }
}

// MARK: User Defaults
extension UserDefaults {
  // check for is first launch - only true on first invocation after app install, false on all further invocations
  // Note: Store this value in AppDelegate if you have multiple places where you are checking for this flag
  static func isFirstLaunch() -> Bool {
    let hasBeenLaunchedBeforeFlag = "totaNewKey"
    let isFirstLaunch = !UserDefaults.standard.bool(forKey: hasBeenLaunchedBeforeFlag)
    if (isFirstLaunch) {
      UserDefaults.standard.set(true, forKey: hasBeenLaunchedBeforeFlag)
      UserDefaults.standard.synchronize()
    }
    return isFirstLaunch
  }
}

extension UIApplication {
  func endEditing() {
    DispatchQueue.main.async { [weak self] in
      self?.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

  }

  //  func startEditing(){
  //    sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
  //  }
}

//extension  SCNGeometry{
//  /**
//   Get the vertices (3d points coordinates) of the geometry.
//   - returns: An array of SCNVector3 containing the vertices of the geometry.
//   */
//  func vertices() -> [SCNVector3]? {
//
//    let sources = self.sources(for: .vertex)
//
//    guard let source  = sources.first else{return nil}
//
//    let stride = source.dataStride / source.bytesPerComponent
//    let offset = source.dataOffset / source.bytesPerComponent
//    let vectorCount = source.vectorCount
//
//    return source.data.withUnsafeBytes { (buffer : UnsafePointer<Float>) -> [SCNVector3] in
//
//      var result = Array<SCNVector3>()
//      for i in 0...vectorCount - 1 {
//        let start = i * stride + offset
//        let x = buffer[start]
//        let y = buffer[start + 1]
//        let z = buffer[start + 2]
//        result.append(SCNVector3(x, y, z))
//      }
//      return result
//    }
//  }
//}

extension AVAsset {

  func videoOrientation() -> (orientation: UIInterfaceOrientation, device: AVCaptureDevice.Position) {
    var orientation: UIInterfaceOrientation = .unknown
    var device: AVCaptureDevice.Position = .unspecified

    let tracks :[AVAssetTrack] = self.tracks(withMediaType: AVMediaType.video)
    if let videoTrack = tracks.first {

      let t = videoTrack.preferredTransform

      if (t.a == 0 && t.b == 1.0 && t.d == 0) {
        orientation = .portrait

        if t.c == 1.0 {
          device = .front
        } else if t.c == -1.0 {
          device = .back
        }
      }
      else if (t.a == 0 && t.b == -1.0 && t.d == 0) {
        orientation = .portraitUpsideDown

        if t.c == -1.0 {
          device = .front
        } else if t.c == 1.0 {
          device = .back
        }
      }
      else if (t.a == 1.0 && t.b == 0 && t.c == 0) {
        orientation = .landscapeRight

        if t.d == -1.0 {
          device = .front
        } else if t.d == 1.0 {
          device = .back
        }
      }
      else if (t.a == -1.0 && t.b == 0 && t.c == 0) {
        orientation = .landscapeLeft

        if t.d == 1.0 {
          device = .front
        } else if t.d == -1.0 {
          device = .back
        }
      }
    }

    return (orientation, device)
  }
}

extension View {
  func onFrameChange(frameHandler: @escaping (CGRect) -> ()) -> some View {
    return AnyView(self.background(
      GeometryReader { geometry in
      Color.clear
        .beforeReturn {
          frameHandler(geometry.frame(in: .global))
        }
    }
    ))
  }

  private func beforeReturn(_ onBeforeReturn: () -> ()) -> Self {
    onBeforeReturn()
    return self
  }
}

