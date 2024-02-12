# GI4.0 iOS Library

## Setup
The library is delivered as a Swift package / Pod. Please follow the following steps to include it into your project.

### Step 1
Either add the Swift package from https://github.com/GI4-0/GI4.0-Library-iOS and make sure the binary is linked (go to your target -> Build Phases -> Link Binary With Libraries -> Add GI40Lib) or via CocoaPods like following "pod 'GI40Lib', :git => 'https://github.com/GI4-0/GI4.0-Library-iOS', :tag => '1.2.0'" or add the library https://github.com/GI4-0/GI4.0-Library-iOS/GI40Lib/Sources/GI40Lib.xcframework in the section "Framework, Libraries, and Embeded Content" in your project settings and choose "Embed & Sign".

### Step 2
Add the following frameworks via Swift Package Manager or CocoaPods:

| Framwork | Version | URL |
| -------- | ------- | --- |
| Realm | 10.46.0 - Exact Version | https://github.com/realm/realm-swift.git |
| Apollo | 0.51.2 - Next Major | https://github.com/apollographql/apollo-ios |
| Alamofire | 5.5.0 - Next Major | https://github.com/Alamofire/Alamofire.git |
| AlamofireImage | 4.2.0 - Next Major | https://github.com/Alamofire/AlamofireImage.git |
| MatomoTracker | 7.5.1 - Next Major | https://github.com/matomo-org/matomo-sdk-ios.git |
| XLActionController | 5.0.0 - Next Major | https://github.com/xmartlabs/XLActionController |

If Realm causes issues, when installed via Swift Package Manager or CocoaPods, please use the compiled binaries from GitHub. They can be found at https://github.com/realm/realm-swift/releases/ under the assets of the corresponding release.

### Step 3
 Add the following lines to your info.plist:

```
 <key>NSCameraUsageDescription</key>
	<string>Zum Barcodescannen wird der Zugriff auf die Kamera benötigt.</string>
 <key>UILaunchStoryboardName</key>
 <dict>
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>gi40</string>
    </array>
</dict>   
```

 ### Step 4
 Build and run your project.

## Using the SDK

### Initializing the SDK

To initialize the SDK, first import the library in your RootViewController:

```
import GI40Lib
```

In your ```viewDidLoad``` method, insert the following line

```
GI40Library.sharedInstance.initLib(navigationController: navigationController)
```

where  ```navigationController``` is your UINavigationController.

### Search ViewController

To create the SearchVC, just call

```
let searchVC = SearchVC.create()
```

Afterwards you can push it to your navigation controller:

```
navigationController?.pushViewController(searchVC, animated: true)
```

### Scan ViewController

To create the ScanVC, just call

```
let scanVC = ScanVC.create()
```

Afterwards you can push it to your navigation controller:

```
navigationController?.pushViewController(scanVC, animated: true)
```

### History ViewController

To create the HistoryVC, just call

```
let historyVC = HistoryVC.create()
```

Afterwards you can push it to your navigation controller:

```
navigationController?.pushViewController(historyVC, animated: true)
```
