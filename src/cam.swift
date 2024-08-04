import AVFoundation

func listWebcams() {
    let discoverySession = AVCaptureDevice.DiscoverySession(
        deviceTypes: [.builtInWideAngleCamera, .external],
        mediaType: .video,
        position: .unspecified
        )
    let devices = discoverySession.devices
    
    for (index, device) in devices.enumerated() {
        print("\(index): \(device.localizedName)")
    }
}

listWebcams()

/*
--------------------------------------------------------------------------------
➜  tclcam git:(main) ✗ swift src/cam.swift
src/cam.swift:4:101: warning: 'externalUnknown' was deprecated in macOS 14.0: renamed to 'AVCaptureDevice.DeviceType.external'
    let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .externalUnknown], mediaType: .video, position: .unspecified)
                                                                                                    ^
src/cam.swift:4:101: note: use 'AVCaptureDevice.DeviceType.external' instead
    let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .externalUnknown], mediaType: .video, position: .unspecified)
                                                                                                    ^~~~~~~~~~~~~~~
                                                                                                    AVCaptureDevice.DeviceType.external
--------------------------------------------------------------------------------
➜  tclcam git:(main) ✗ swift src/cam.swift
src/cam.swift:4:35: warning: 'devices(for:)' was deprecated in macOS 10.15: Use AVCaptureDeviceDiscoverySession instead.
    let devices = AVCaptureDevice.devices(for: .video)
                                  ^
2024-08-04 02:43:16.724 swift-frontend[23540:554067] WARNING: AVCaptureDeviceTypeExternal is deprecated for Continuity Cameras. Please use AVCaptureDeviceTypeContinuityCamera and add NSCameraUseContinuityCameraDeviceType to your Info.plist.
0: FaceTime HD Camera
1: cwervoPhone Camera

--------------------------------------------------------------------------------
➜  tclcam git:(main) ✗ swift -e "import AVFoundation; AVCaptureDevice.devices(for: .video).forEach { print($0.localizedName) }"
-e:1:75: error: '/' is not a prefix unary operator
import AVFoundation; AVCaptureDevice.devices(for: .video).forEach { print(/bin/zsh.localizedName) }
                                                                          ^
-e:1:76: error: cannot find 'bin' in scope
import AVFoundation; AVCaptureDevice.devices(for: .video).forEach { print(/bin/zsh.localizedName) }
                                                                           ^~~
-e:1:80: error: cannot find 'zsh' in scope
import AVFoundation; AVCaptureDevice.devices(for: .video).forEach { print(/bin/zsh.localizedName) }
                                                                               ^~~
-e:1:67: error: contextual type for closure argument list expects 1 argument, which cannot be implicitly ignored
import AVFoundation; AVCaptureDevice.devices(for: .video).forEach { print(/bin/zsh.localizedName) }
*/