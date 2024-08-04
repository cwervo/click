#import <AVFoundation/AVFoundation.h>

void listWebcams() {
    AVCaptureDeviceDiscoverySession *discoverySession = [AVCaptureDeviceDiscoverySession
        discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeExternal]
        mediaType:AVMediaTypeVideo
        position:AVCaptureDevicePositionUnspecified];
    
    NSArray<AVCaptureDevice *> *devices = discoverySession.devices;
    
    [devices enumerateObjectsUsingBlock:^(AVCaptureDevice *device, NSUInteger index, BOOL *stop) {
        NSLog(@"%lu: %@", (unsigned long)index, device.localizedName);
    }];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        listWebcams();
    }
    return 0;
}
