# SimpleOAuth2 [![CircleCI](https://circleci.com/gh/rbaumbach/SimpleOAuth2.svg?style=svg)](https://circleci.com/gh/rbaumbach/SimpleOAuth2) [![codecov](https://codecov.io/gh/rbaumbach/SimpleOAuth2/branch/master/graph/badge.svg)](https://codecov.io/gh/rbaumbach/SimpleOAuth2) [![Cocoapod Version](http://img.shields.io/badge/pod-v0.1.1-blue.svg)](http://cocoapods.org/?q=SimpleOAuth2) [![Cocoapod Platform](http://img.shields.io/badge/platform-iOS-blue.svg)](http://cocoapods.org/?q=SimpleOAuth2) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/SimpleOAuth2/blob/master/MIT-LICENSE.txt)

A simple OAuth2 helper

## Adding SimpleOAuth2 to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add SimpleOAuth2 to your project.

1.  Add SimpleOAuth2 to your Podfile `pod 'SimpleOAuth2'`.
2.  Install the pod(s) by running `pod install`.
3.  Add SimpleOAuth2 to your files with `#import <SimpleOAuth2/SimpleOAuth2.h>`.

### Carthage

1. Add `github "rbaumbach/SimpleOAuth2"` to your Cartfile.
2. [Follow the directions](https://github.com/Carthage/Carthage#getting-started) to add the dynamic framework to your target.

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from 'Source' directory to your project (As well as the dependencies listed in the Podfile).

## Tools

* Use SimpleOAuth2AuthenticationManager to authenticate an OAuth2 client.
* The NSURLRequest+SimpleOAuth2 catgeory provides a helper method to obtain a authorization code from an NSURLRequest from an API.  It also has a method to build a web login request with an optional permissionScope.  If no permission scope is needed, pass in nil.

## Testing

* Prerequisites: [ruby](https://github.com/sstephenson/rbenv), [ruby gems](https://rubygems.org/pages/download), [bundler](http://bundler.io)

This project has been setup to use [fastlane](https://fastlane.tools) to run the specs.

First, run the setup.sh script to bundle required gems and Cocoapods when in the project directory:

```bash
$ ./setup.sh
```

And then use fastlane to run all the specs on the command line:

```bash
$ bundle exec fastlane specs
```

## Version History

Version history can be found at the [SimpleOAuth2 wiki](https://github.com/rbaumbach/SimpleOAuth2/wiki/Version-History).

## Suggestions, requests, and feedback

Thanks for checking out SimpleOAuth2 for your OAuth2 needs.  Any feedback can be can be sent to: <github@ryan.codes>.
