# JDCoordinator

[![GitHub release](https://img.shields.io/github/release/jandamm/JDCoordinator.svg)](https://github.com/jandamm/JDCoordinator/releases) [![Swift 4.1](https://img.shields.io/badge/swift-4.1-red.svg?style=flat)](https://developer.apple.com/swift) [![License](https://img.shields.io/github/license/jandamm/JDCoordinator.svg)](https://github.com/jandamm/JDCoordinator/blob/master/LICENSE) [![Maintainability](https://api.codeclimate.com/v1/badges/3d02bf72b4843aa4b95a/maintainability)](https://codeclimate.com/github/jandamm/JDCoordinator/maintainability) [![Twitter](https://img.shields.io/badge/twitter-jandammm-blue.svg)](https://twitter.com/jandammm) 
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Cocoapods](https://img.shields.io/cocoapods/v/JDCoordinator.svg?style=flat)](http://cocoapods.org/pods/JDCoordinator) [![Platform](https://img.shields.io/cocoapods/p/JDCoordinator.svg?style=flat)](http://cocoapods.org/pods/JDCoordinator)

| Master | Develop |
| :---: | :---: |
| [![Build Status](https://travis-ci.org/jandamm/JDCoordinator.svg?branch=master)](https://travis-ci.org/jandamm/JDCoordinator) | [![Build Status](https://travis-ci.org/jandamm/JDCoordinator.svg?branch=develop)](https://travis-ci.org/jandamm/JDCoordinator) |
| [![Coverage Status](https://coveralls.io/repos/github/jandamm/JDCoordinator/badge.svg?branch=master)](https://coveralls.io/github/jandamm/JDCoordinator?branch=master) | [![Coverage Status](https://coveralls.io/repos/github/jandamm/JDCoordinator/badge.svg?branch=develop)](https://coveralls.io/github/jandamm/JDCoordinator?branch=develop) |
| [![Documentation](https://github.com/jandamm/JDCoordinator/blob/master/docs/badge.svg)](https://cdn.rawgit.com/jandamm/JDCoordinator/master/docs/index.html) | [![Documentation](https://github.com/jandamm/JDCoordinator/blob/develop/docs/badge.svg)](https://cdn.rawgit.com/jandamm/JDCoordinator/develop/docs/index.html) |

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

JDCoordinator is available through [Carthage](https://github.com/Carthage/Carthage) and [CocoaPods](https://cocoapods.org). 

#### Carthage:

```
github "jandamm/JDCoordinator"
```

#### CocoaPods:

```
pod "JDCoordinator"
```

## Author

Jan Dammshäuser, [jandammshaeuser@gmail.com](mailto:jandammshaeuser@gmail.com)

## License

JDCoordinator is available under the MIT license. See the LICENSE file for more info.
