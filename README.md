# SimpleOAuth2 [![Build Status](https://travis-ci.org/rbaumbach/SimpleOAuth2.svg?branch=master)](https://travis-ci.org/rbaumbach/SimpleOAuth2) [![Cocoapod Version](http://img.shields.io/badge/pod-v0.0.3-blue.svg)](http://cocoapods.org/?q=SimpleOAuth2) [![Cocoapod Platform](http://img.shields.io/badge/platform-iOS-blue.svg)](http://cocoapods.org/?q=SimpleOAuth2) [![License](http://b.repl.ca/v1/License-MIT-blue.png)](https://github.com/rbaumbach/SimpleOAuth2/blob/master/MIT-LICENSE.txt)

A simple OAuth2 helper

## Adding SimpleOAuth2 to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add SimpleOAuth2 to your project.

1.  Add SimpleOAuth2 to your Podfile `pod 'SimpleOAuth2'`.
2.  Install the pod(s) by running `pod install`.
3.  Add SimpleOAuth2 to your files with `#import <SimpleOAuth2/SimpleOAuth2.h>`.

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from 'Source' directory to your project (As well as the dependencies listed in the Podfile).

## Tools

* Use SimpleOAuth2AuthenticationManager to authenticate an OAuth2 client.
* The NSURLRequest+SimpleOAuth2 catgeory provides a helper method to obtain a authorization code from an NSURLRequest from an API.  It also has a method to build a web login request with an optional permissionScope.  If no permission scope is needed, pass in nil. 

## Testing

* Prerequisites: [ruby](https://github.com/sstephenson/rbenv), [ruby gems](https://rubygems.org/pages/download), [bundler](http://bundler.io)

To use the included Rakefile to run expecta tests, run the setup.sh script to bundle required gems and cocoapods:

```bash
$ ./setup.sh
```

Then run rake to run the tests on the command line:

```bash
$ bundle exec rake
```

Additional rake tasks can be seen using rake -T:

```bash
$ rake -T
rake build  # Build SimpleOAuth2
rake clean  # Clean
rake test   # Run Tests
```

## Version History

Version history can be found at the [SimpleOAuth2 wiki](https://github.com/rbaumbach/SimpleOAuth2/wiki/Version-History).

## Suggestions, requests, and feedback

Thanks for checking out SimpleOAuth2 for your OAuth2 needs.  Any feedback can be can be sent to: rbaumbach.github@gmail.com.
