# SolarTransition

SolarTransition is a cocoapod for circular animated transition from UIButton which is a square shape with rounded corners by half of its width or height.

[![Version](https://img.shields.io/cocoapods/v/SolarTransition.svg?style=flat)](http://cocoapods.org/pods/SolarTransition)
[![License](https://img.shields.io/cocoapods/l/SolarTransition.svg?style=flat)](http://cocoapods.org/pods/SolarTransition)
[![Platform](https://img.shields.io/cocoapods/p/SolarTransition.svg?style=flat)](http://cocoapods.org/pods/SolarTransition)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

</br>
<p>
<p align="center">
<img src="https://github.com/MatijaKruljac/SolarTransition/blob/master/solartransition.gif?raw=true" >
</p>
</br>

## Requirements

- iOS 8.0+
- Xcode 8
- Swift 3.0

## Installation

SolarTransition is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

```swift
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod "SolarTransition"
end
```

## Usage

Code below is used when transition starts from first ViewController (`fromViewController`) to second ViewController (`toViewController`) with a tap on rounded UIButton. `SolarTransitionAnimator` has to be initialized with duration of animation, transition type and with `originView`. After creating `toViewController`, `originView` of `toViewController` is rounded UIButton which is mentioned earlier and needs to be set. Last thing that is left is just to call `present()` method of `SolarTransitionAnimator` with `toViewController` and `navigationController`.

```swift
let solarTransitionAnimator = SolarTransitionAnimator(
    withDuration: TimeInterval(0.3),
    forTransitionType: .presenting,
    originView: startSolarTransitionButton
)
let toViewController = ToViewController(
    nibName: "ToViewController",
    navigationService: navigationService
)
toViewController.originView = startSolarTransitionButton
solarTransitionAnimator.present(
    viewController: toViewController,
    inNavigationController: navigationController
)
```

Before transition can be successful second ViewController (`toViewController`) needs to implement `SolarTransitionOriginProtocol`.

```swift
public protocol SolarTransitionOriginProtocol {
    var originView: UIView? { get set }
}
```

This protocol demands declaration of `originView` property which is set in first ViewController (`fromViewController`). 

When dissmising second ViewController (`toViewController`) `SolarTransitionAnimator` must be initialized with duration of animation, transition type and with `originView`. For dissmising ViewController `dismiss()` method of SolarTransitionAnimator is called.

```swift
class ToViewController: UIViewController, SolarTransitionOriginProtocol {

    // ...
    guard let originView = originView else { return }
    let solarTransitionAnimator = SolarTransitionAnimator(
          withDuration: TimeInterval(0.5),
          forTransitionType: .dismissing,
          originView: originView
     )
     solarTransitionAnimator.dismiss(
          viewController: self,
          inNavigationController: navigationController
     )
}
```

## Author

Matija Kruljac, kruljac.matija@gmail.com

## License

SolarTransition is available under the MIT license. See the LICENSE file for more info.
