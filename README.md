# JDCoordinator

[![CI Status](http://img.shields.io/travis/charmaex/JDCoordinator.svg?style=flat)](https://travis-ci.org/charmaex/JDCoordinator)
[![Version](https://img.shields.io/cocoapods/v/JDCoordinator.svg?style=flat)](http://cocoapods.org/pods/JDCoordinator)
[![License](https://img.shields.io/cocoapods/l/JDCoordinator.svg?style=flat)](http://cocoapods.org/pods/JDCoordinator)
[![Platform](https://img.shields.io/cocoapods/p/JDCoordinator.svg?style=flat)](http://cocoapods.org/pods/JDCoordinator)

Library for easier implementation of the [coordinator concept](http://khanlou.com/2015/10/coordinators-redux/) by [@khanlou](https://twitter.com/khanlou).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Content

### Classes
#### JDAppCoordinator:
Use this class to start your whole app. Implement it into your AppDelegate or make it a singleton (see Example-App).

#### JDCoordinator:
A basic Coordinator that will manage one or more ViewControllers.    
In most cases you would want to start with a JDCoordinator implementation and switch to a JDParentCoordinator when needed.

#### JDParentCoordinator:
A Coordinator that can have one or more ChildCoordinators and ViewControllers.

### Protocols
JDCoordinator has some protocols that are combinable.   
You do not have to use any protocol if you’re satisfied with the default classes implemented by me. If you need any other combination of protocols feel free to contact me.

## Installation

JDCoordinator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JDCoordinator"
```

## Author

Jan Dammshäuser, [jandammshaeuser@gmail.com](mailto:jandammshaeuser@gmail.com)

## License

JDCoordinator is available under the MIT license. See the LICENSE file for more info.
