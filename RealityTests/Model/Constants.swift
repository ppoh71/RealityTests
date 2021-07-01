//
//  Constants.swift
//  arvisto
//
//  Created by Peter Pohlmann on 06.07.19.
//  Copyright © 2019 Peter Pohlmann. All rights reserved.
//

import UIKit
import SwiftUI

struct Constants {
  
 // static let awsBucket = "https://arvisto3878248eba0f456fa34c9a63371b2472132755-dev.s3.amazonaws.com"
  
  static var fontNormal = ""
  static var fontBold = ""
  static var darkColor = UIColor(red:0.19, green:0.19, blue:0.19, alpha:1.0)
  static var lightColor = Color(UIColor(red:0.84, green:0.84, blue:0.84, alpha:1.0))
  
  static var darkFormColorUI = UIColor(red:0.51, green:0.51, blue:0.54, alpha:1.0)
  static var darkFormColor = Color(UIColor(red:0.51, green:0.51, blue:0.54, alpha:1.0))
  
  static var yellow = Color(UIColor.hexColor(hex: "#FBA700"))
  static var yellowAlphaUIColor = UIColor(red: 250, green: 167, blue: 0, alpha: 0.5)
  static var yellowUIColor = UIColor.hexColor(hex: "#FBA700")
  static var yellowUIColor2 = UIColor(red:0.51, green:0.250, blue:0.195, alpha:1.0)
  static var red = Color(UIColor.hexColor(hex: "#B71C1C"))
  
  static var darkGray = Color(UIColor.hexColor(hex: "#131313"))
  static var darkGrayLighter = Color(UIColor.hexColor(hex: "#373737"))
  static var lighterGray = Color(UIColor.hexColor(hex: "#4A4B4C"))
  static var white = UIColor(red:1, green:1, blue:1, alpha: 1)
  static var menuBack = Color(UIColor.hexColor(hex: "#212121"))
  
  /// system gray back 1C1C1E
  static var systemGrayBack = Color(UIColor.hexColor(hex: "#1C1C1E"))
  
  // shadow tests
  static let gradientDarkStart = Color(UIColor.hexColor(hex: "#131313"))
  static let gradientDarkEnd = Color.black
  static let gradientLightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
  static let gradientLightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
  
  // gradients
  static let gradientDefaultUIColor2 = UIColor.hexColor(hex: "#131313")
  static let gradientDefaultUIColor1 = UIColor(red:0.0, green:0.0, blue:0.0, alpha:1.0)
  
  static let gradientWallUIColor1 =  UIColor(red:0.19, green:0.19, blue:0.19, alpha:1.0)
  static let gradientWallUIColor2 =  UIColor(red:0, green:0, blue:0, alpha:1.0)
  
  static let gradientDisplayUIColor1 = UIColor.hexColor(hex: "#131313")
  static let gradientDisplayUIColor2 = UIColor.hexColor(hex: "#000000")
  
  static let gradientYellow2 = UIColor.hexColor(hex: "#FBA700")
  static let gradientYellow1 = UIColor.hexColor(hex: "#FF7E00")
  
  // ar colors
  static var defaultRed = UIColor.hexColor(hex: "#B71C1C")
  static let screenOpacity: CGFloat = 1
  
  static let screenColor = UIColor.hexColor(hex: "#131313")
  static var screenColorDefaultHex = "#131313" // sets the default diplay color NOW!
  static let screenActiveShapeColor = UIColor.green
  
  static var displayColorDefault = UIColor.hexColor(hex: "#373737")
  static var displayColorDefaultHex = "#373737" // sets the default diplay color NOW!
  
  static var displayColorMove = UIColor.hexColor(hex: "#F7B500")
  static let wireframeStrikeSize = 15
  static let wireframeColor = white.cgColor
  static let wireframeHightBoxesColor = wireframeColor
  
  static let deltaDistanceToDisplay: Float = 0.0042
  static let displayWidthDefault: Float = 0.6
  
  static let defaultDoubleSidedShape: Bool = true
  
  static let defaultTransaprentShapeRebuid: CGFloat = 1
  
  // UI menu
  static let menuOffOpacity: Double = 0.9
  static let menuOffOpacityFirstCreation: Double = 0.5
  
  // Button Size
  static let buttonSizeMenuPopupButton: CGFloat = 150
  static let buttonSizeMenuStack: CGFloat = 100
  
  // image ratio
  static let imageRatio16To9: CGFloat = 0.56
  static let imageRatio: CGFloat = 0.7
  static let imageRatioOverview: CGFloat = 0.75
  static let imageRatioTutorial: CGFloat = 0.9
  static let imageRatioWide: CGFloat = 1.5
  
  // image sizes defaults
  static let listImageSavedWidth: CGFloat = 150
  static let listImagePublishedWidth: CGFloat = 180
  
  // translation defaults
  static let translationDefaultRotationGreenscreen: Float = 0.04
  static let translationDefaultYGreenscreen: Float = 0.005
  static let translationDefaultDisplaySize: Float = 0.002
  
  // ud key
  static let dontShowScanGroundInfoKey = "dontShowScanGroundInfo"
  
  // Model & Node Names
  static let baseLineGreenscreenNameString = "baseLineGreenScreen"
  static let baseNodeNameString = "BaseNode"
  static let groundAnchorNameString = "GroundAnchor"
  static let groundAnchorTranslationMoveString = "TranslationMoveAnchor"
  static let studioNameString = "Studio-"
  static let greenscreenNodeString = "Greenscreen-"
  static let planeShapeNameString = "PlaneShape"
  static let solidShapeNameString = "ClosedTopShape"
  static let solidShapeBottomNameString = "ClosedBottomShape"
  static let wireframeNameString = "Wireframe"
  static let wireframeMultilineThickness = 6
  static let displaysNameString = "Displays-"
  static let frameDisplayNameString = "FrameDisplay"
  static let frameDisplayTempNameString = "TempFrameDisplay"
  static let greenscreenHeightReferenceString = "HeightReference"
  static let greenscreenHeightReferenceStringExtended = "HeightReferenceExtended"
  static let tempGreenscreenHeightReferenceString = "TempGreenscreenHeightReference"
  static let wireHeightSegmentString = "WireHeightSegment"
  static let groundAnchorString = "GroundAnchorTarget"
  static let moveTranslationAnchorString = "moveTranslationAnchor"
  static let rotateTranslationAnchorString = "rotateTranslationAnchor"
  static let rotateTranslationIndicatorString = "rotateTranslationIndicator"
  static let rotateTranslationHelperNodeString = "rotateTranslationHelperNode"
  
  static let noEditWhenGroundShapeText = " Ground Shape !! "
  static let noBaselineEditWhenGroundShapeText = ""
  
  // RCatSubs
  static let hasProSubsriptionKeyString = "arvieAr.hasSubscription"
  
  // Text Strings
  static let textMirrorMaterialMessage = "Mirror Material "
  static let textAspectRationOptionMessage = "Aspect Ratio "
  static let textShowGridOptionMessage = "Grid "
  static let textOpacityOptionMessage = "Opacity "
  static let textSolidShapeMessage = "Solid Shape "
  static let textGroundShapeMessage = "Ground Shape "
  static let textLightOptionMessage = "Light Effects "
  
  // documents
  static let fileManager = FileManager.default
  static var documentsUrl: URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
  }
  
  static let defaultBuildDelay: Double = 0.1
  
  static let mediaUploadsVideoDirectory = "mediaUploadsVideo"
  static let mediaUploadsImageDirectory = "mediaUploadsImage"
  static let thumbFileSuffix = "thumb_"
  static let mediaUploadsThumbnailsDirectory = "mediaUploadsThumbnail"
  static let videosDirectory = "videos"
  static let mediaSavedStudiosDirectory = "mediaSavedStudios"
  //static let mediaSavedStudiosThumbsSavedDirectory = "mediaSavedStudiosThumbs"
  static let mediaDownloadedStudiosDirectory = "mediaDownloadedStudios"
  static let media3DModelsDirectory = "media3DModelsDirectory"
  
  // keys
  static let standardImagesUploadedKey = "StandardImagesUploaded"
  static let standardShowMoveRotateKey = "MoveRotateInfoShow"
  static let standardVideosUploadedKey = "StandardVideosUploaded"
  static let acceptedTermsConditionKey = "acceptedTermsCondition"
  static let removedlibraryModelsKey = "RemovedlibraryModels"
  static let downloadURLInProgress = "DownloadURLInProgress"
  
  //aws storage key names
  static let awsStorageMetaStudiosBaseDir = "metaStudios"
  static let awsStorageStudiosBaseDir = "studios"
  static let awsStorageModelLibraryBaseDir = "modelLibrary"
  static let awsStorageKeyForStandardImages = "standardImages"
  static let awsStorageKeyForStandardVideos = "standardVideos"
  static let awsStorageKeyForStandardOnboardImage = "standardOnboardImage"
  
  // text
  static let arvieTextWelcomeTitle = "Welcome to Arvie AR"
  static let arvieTextWelcomeSubtitle = "Please take a minute and watch the How-To Video"
  static let arvieTextTutorialTitle = "Tutorial Video"
  static let arvieTextTutorialSubtitle = "Find more Recources on our Website"
  static let arvieTextNoThanks = "No thanks, let me try it out first."
  static let arvieTextRecordDemoVideo = "Record Demo Video"
  static let arvieTextGoOnWithFree = "Go on with Free Version"
  
  static let arvieTextSubscriptionSubline = "This is an Independent App made with Passion and Love. \n Your Subscription will help us making it even \n more powerful & innovative.".uppercased()
  
  static let arvieTextSubscriptionLegal = "PAYMENT WILL BE CHARGED TO YOUR ITUNES ACCOUNT AT CONFIRMATION OF PURCHASE. * SUBSCRIPTION WILL AUTOMATICALLY RENEW UNLESS AUTO-RENEW ISTURNED OFF AT LEAST 24 HOURS BEFORE THE END OF CURRENT PERIOD. * YOUR ACCOUNT WILL BE CHARGED ACCORDINGLY TO YOUR PLAN FOR RENEWAL WITHIN 24 HOURS PRIOR TO THE END OF THE CURRENT PERIOD. * YOU CAN MANAGE OR TURN OFF AUTO-RENEW IN YOU APPLE ID ACCOUNT SETINGS AT ANY TIME AFTER PURCHASE. * ANY UNUSED PORTION OF A FREE TRIAL PERIOD, IF OFFERED, WILL BE RFEITED WHEN THE USER PURCHASES A SUBSCRIPT ION TO THAT PUBLICATION, WHERE APPLICABLE.".uppercased()
  
  // Auth Text
  
  static let authTextSignInMenu = "Sign In"
  static let authTextRegisterMenu = "Register"
  
  static let authTextEmail = "E-Mail"
  static let authTextPasswordAsterisk = "Password*"
  static let authTextPassword = "Password"
  static let authTextPasswordRepeat = "Repeat Password"
  static let authTextCurrentPassword = "Current Password"
  static let authTextEmailNotValid = "E-Mail address is not valid"
  static let authTextPasswordRequirements = "*Minimum 8 characters, 1 Alphabet and 1 Number"
  static let authTextPasswordNotEqual = "Passwords don't match"
  static let authTextPasswordFailedText = "Minimum 8 characters at least 1 Alphabet and 1 Number"
  static let authTextPasswordAverageText = "Average Password"
  static let authTextPasswordStrongText = "Strong Password"
  static let authTextPasswordStrongerText = "Stronger Password"
  static let authTextNewUserErrorMsg = "Something went wrong. Please try again"
  static let authTextButtonRegister = "Register"
  static let authTextButtonSignIn = "Log In"
  static let authTextButtonPasswordForgottenLink = "Password Forgotten?"
  static let authTextButtonPasswordForgotten = "Reset Password"
  static let authTextPasswordForgottenDesc = "Reset password via E-Mail."
  static let authTextSendVerifyEmail = "Send E-Mail Verification"
  static let authTextVerifyEmail = "Verify E-Mail "
  static let authTextEmailVerified = "E-Mail Verified"
  static let authTextSendVerifyEmailSuccess = "We have sent you an E-Mail to verify your password."
  static let authTextPasswordForgottenSuccess = "We have sent you an E-Mail to reset your password."
  static let authTextErrorMsgFallback = "Something went wrong. Please try again"
  static let authTextButtonClose = "Close"
  static let authTextButtonBack = "Back"
  static let authSignInSuccess = "You are successfully signed in with:"
  static let authRegisterSuccess = "You are successfully registered in with:"
  
  // home
  static let homeNavFeatured = "Featured"
  static let homeNavLatest = "#"
  static let homeNavHash = "  #  "
  
  // create
  static let createTitle = "Create"
  static let createCopy = "Build your own AR and share it with the world."
  static let createButtonText = "Start Creating"
  static let createTutorials = "Tutorial Videos"
  
  // profil
  static let profilAccount = "Account"
  static let profilTextEditEmail = "Edit E-Mail"
  static let profilTextNewEmail = "New E-Mail"
  static let profilTextChangePassword = "Edit Password"
  static let profilTextNewPassword = "New Password"
  static let profilTextNewPasswordRepeat = "New Password Repeat"
  static let profilTextSetNewPassword = "Set New Password"
  static let profilTextChangeUsername = "Edit Username"
  static let profilTextNewUsername = "New Username"
  static let profilTextDeleteProfil = "Delete Profil"
  static let profilTextDeleteProfilSuccess = "Profil Deleted"
  
  //save
  static let saveTextSaveNewStudio = "Save New AR Studio"
  static let saveTextUpdateStudio = "Update Studio"
  static let saveTextUpdate = "Update Studio"
  static let saveTextSaveAsNew = "Save as new"
  static let saveTextStudioName = "Enter Name"
  static let saveTextTakeScreenshot = "Take a Screenshot"
  static let saveTextScreenshot = "Screenshot"
  static let saveTextSaved = "Saved"
  static let saveTextPublished = "Published"
  static let saveTextSavedAndPublished = "Studios"
  static let saveTextName = "Name"
  static let saveTextDescription = "Description"
  static let saveTextNameEdit = "Eidt Studio Name"
  static let saveTextDescriptionEdit = "Edit Description"
  static let saveTextAddDescription = "+ Description"
  static let saveTextMinDescrChar = "Min. 20 Character"
  static let saveTextMinNameChar = "Min. 3 Character"
  static let saveTextEditName = "Studio Name"
  static let saveTextEditDescription = "Studio Description"
  static let saveTextDetail = "Studio Detail"
  static let saveTextDeleteStudio = "Delete AR"
  static let saveTextConfirmDeleteStudio = "Confirm Delete AR"
  static let saveTextPublishStudioButton = "Publish"
  static let saveTextPublishStudioPublished = "Published AR"
  static let saveTextPublishStudioNowButton = "Publish AR Now"
  static let saveTextUnpublishStudioButton = "Unpublish AR"
  static let saveTextLoadStudioButton = "Load AR"
  
  // publish
  static let publishTextCopy = "Publish & share your ceated AR Content."
  static let publishTextSucess = "AR published succesfully."
  static let publishTextExplain = "By publishing your AR it will be available for every user. You can share the link."
  static let publishTextShareExplain = "Copy or share the link to your AR Content. "
  static let publishTextGuidelines = "Guidelines \nUser your own photos and video \nOffensive or illegal content is not welcome and will be removed."
  static let publishTextErrorFiles1 = "Files are  larger than:"
  static let publishTextErrorFiles2 = "All files larger than: "
  static let publishTextErrorSmallerFiles = "Please use smaller or less files"
  static let publishTextUnpublish = "Unpublish"
  static let publishTextUnpublishButton = "Yes, Unpublish Now"
  
  // More
  static let moreTextAccount = "Account"
  static let moreTextSubscription = "Subscription"
  static let moreTextAbout = "About"
  
  // More Metas
  static let moreRateUs = "Rate us"
  static let moreRateUsCopy = "Let us know if you like Arvie"
  static let moreFeedback = "Feedback"
  static let moreFeedbackCopy = "Get it in touch with us."
  static let moreFollow = "Follow Us"
  
  // Subscription
  static let moreSubscriptionTitle = "Subscribe to Arrea Pro"
  static let moreSubscriptionCopy = "Create, Publish & Explore Unlimited AR"
  static let moreSubscriptionFreeTitle = "Free Version"
  static let moreSubscriptionFreeCopy = "You can use ARREA for Free and create up to 3 Walls and 10 Displays per Studio and also save & publish up to 3 AR Studios."
  static let moreSubscripted = "You Are Subscribed to\nArrea Pro "
  
  // About
  static let moreAboutTitle = "About ARREA"
  static let moreAboutCopy = "Arvie is a tool to create video walls, panels & displays as interaktive 3D objects,  fully integrated into the real world you see through your iPhone camera. (Augmented Reality) . \n\n Apply your own images and videos and create outstanding visual effects.  With Arvie you are able to create video content for visual storytelling, record high quality videos in realtime or even live stream to Twitch, Periscope, Youtube & co. "
  
  static let moreAboutPublishingTitle = "Publishing AR"
  
  
  // Defaults
  static let formFontSizeDefault: CGFloat = 22
  static let formSpaceing: CGFloat = 50
  static let defaultTextSkip = "Skip"
  static let defaultTextSave = "Save"
  static let defaultTextCancel = "Cancel"
  static let defaultEmail = "E-Mail"
  static let defaultUsername = "Username"
  static let defaultPassword = "Password"
  static let defaultPasswordChange = "Change Password"
  static let defaultDeleteProfil = "Delete Profil"
  static let defaultLogout = "Logout"
  static let studioNameLength = 50
  static let studioDescriptionLength = 650
  static let maxSnapshotHeight: Int = 1400
  static let snapShotDefaultName = "Snapshot"
  static let previewDefaultName = "Preview"
  static let defaultLoading = "Loading"
  static let defaultUploading = "Uploading Files"
  static let defaultObject3dTextInfo = "Model Info"
  static let defaultTextDelete = "Delete"
  static let saveStudioMessage = "Saving AR"
  static let defaultTextNext = "Next"
  static let defaultTextClose = "Close"
  static let defaultTextOK = "OK"
  static let defaultTextShare = "Share AR"
  static let defaultTextLicenseShare = "Copy/Share License Infos"
  static let defaultAboutPublichingShare = "About Publishing AR"
  static let defaultTranslateAllToggle = "all"
  static let defaultFinishIconArrow = "arrow.down"
  static let defaultScaleText = "Scale"
  static let defaultRotateText = "Rotate"
  static let defaultExportUSDZText = "Export"
  static let defaultImportedModelName = "Imported Model"
  
  // viewer
  static let editorMediaText = "Media"
  static let editorHeightText = "Height"
  static let editorBaselineText = "Baseline"
  static let editorSizeText = "Size"
  static let editorPositionText = "Position"
  static let editorSolidShapeText = "Solid"
  static let editorCopyGreenscreenText = "Copy/Paste"
  
  // viewer
  static let viewerMoveText = "Move"
  static let viewerMoveYText = "Altitude"
  static let viewerRotateText = "Rotate"
  static let viewerRecordText = "Record"
  static let viewerRecordButtonText = "Record Video"
  static let viewerBluescreenText = "Bluescreen"
  static let buttonBluescreenText = "Enable Bluescreen Mode"
  
  // editor
  static let editorNextText = "Next"
  static let editorFinishText = ""
  
  
  // Blueprint
  static let blueprintBasename = "Blueprint"
  static let blueprintAnchorNodeName = "BlueprintAnchor"
  static let blueprintFrameNodeName = "BlueprintFrame"
  static let blueprintSwitchMessage = "Switched to Blueprint"
  static let blueprintDefaultSize: CGFloat = 0.5
  static let blueprintFrameScaleValue: CGFloat = 0.01
  static let blueprintDefaultHeight: CGFloat = 0.05
  static let blueprintDefaultColor: UIColor = UIColor.red
  
  static let object3DDetailImagePrefix = "Detail"
  static let object3DBasename = "Arrea-Import-Object3D-"
  static let object3DWireframe = "Object3D-Wireframe"
  static let object3DGroupNodeName = "Object3DGroupAnchor"
  static let object3DtSwitchMessage = "Switched to Object3D"
  
  
  /// Export USDZ
  static let exportUSDZTitle = "Export AR"
  static let exportUSDZCopy = "Export your Augmented Reality to USDZ"
  static let exportUSDZInfo = "USDZ (Universal Scene Description) is a file format for 3D models created by Pixar and adopted by Apple as their specific file format to be used in AR."
  static let exportUSDZButton = "Export to USDZ"
  static let exportUSDZSaveFirstButton = "Save Now"
  static let exportUSDZxx = ""
  
  /// Sketchfab
  static let defaultsSFAuthKey = "SFATHKY"
  
  
  
  
  // Colors
  static let colorArray: [String] = [
    
    /////////////////////////  row 1
    "#B71C1C",
    "#880E4F",
    "#4A148C",
    "#311B92",
    "#1A237E",
    "#0D47A1",
    "#01579B",
    "#006064",
    "#004D40",
    "#1B5E20",
    "#33691E",
    "#827717",
    "#F57F17",
    "#FF6F00",
    "#E65100",
    "#BF360C",
    "#3E2723",
    "#212121",
    "#000000",
    
    /// adds https://www.w3schools.com/colors/colors_picker.asp
    "#0000ff", /// blue
    "#00ccff", //turkis
    "#00e600", /// green
    "#ff0000",  /// red
    "#ff9900", /// orange
    "#ffff00", /// yellow
    "#ff00ff",  // pink
    
    /////////////////////////  row 2
    "#D32F2F",
    "#C2185B",
    "#7B1FA2",
    "#512DA8",
    "#303F9F",
    "#1976D2",
    "#0288D1",
    "#0097A7",
    "#00796B",
    "#388E3C",
    "#689F38",
    "#AFB42B",
    "#FBC02D",
    "#FFA000",
    "#F57C00",
    "#E64A19",
    "#5D4037",
    "#616161",
    "#757575",
    
    /// ads
    "#4d4dff", /// blue
    "#4ddbff", //turkis
    "#4dff4d", /// green
    "#ff4d4d", /// red
    "#ffb84d", /// orange
    "#ffff4d", /// yellow
    "#ff4dff",  // pink

    ///////////////////////// row 3
    "#EF5350",
    "#EC407A",
    "#AB47BC",
    "#7E57C2",
    "#5C6BC0",
    "#42A5F5",
    "#29B6F6",
    "#26C6DA",
    "#26A69A",
    "#66BB6A",
    "#9CCC65",
    "#D4E157",
    "#FFEE58",
    "#FFCA28",
    "#FFA726",
    "#FF7043",
    "#8D6E63",
    "#BDBDBD",
    "#ffffff",
    
    /// adds
    "#b3b3ff", /// blue
    "#b3f0ff", //turkis
    "#b3ffb3", /// green
    "#ffb3b3", /// red
    "#ffe0b3", /// orange
    "#ffffb3", /// yellow
    "#ffb3ff",  // pink
    

    
  ]
}
