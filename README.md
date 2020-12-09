# RatingsRestrictionKit

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/9791699b7b644ee6bd48f2fa84c64d34)](https://app.codacy.com/gh/kumpeapps/RatingsRestrictionKit?utm_source=github.com&utm_medium=referral&utm_content=kumpeapps/RatingsRestrictionKit&utm_campaign=Badge_Grade_Settings)
[![Version](https://img.shields.io/cocoapods/v/RatingsRestrictionKit.svg?style=flat)](https://cocoapods.org/pods/RatingsRestrictionKit)
[![Platform](https://img.shields.io/cocoapods/p/RatingsRestrictionKit.svg?style=flat)](https://cocoapods.org/pods/RatingsRestrictionKit)

** This project has been renamed to [ContentRestrictionKit](https://github.com/kumpeapps/ContentRestrictionsKit). Please visit the [ContentRestrictionKit](https://github.com/kumpeapps/ContentRestrictionsKit) page for updated framework!**

## Features
-   Get Device's Movie Rating Restriction Setting (Raw Value or Text Value)
-   Get the raw value of a supplied Movie Rating (currently supports US ratings ONLY)
-   Determine if supplied Movie Rating is allowed by device restrictions (again, US ONLY)

### Movie Ratings

#### Get Device's Movie Rating Restriction Setting

```swift
RatingsRestrictionKit.getDeviceMovieRestrictionRaw()
```
Returns Raw value of Movie Rating Restriction on Device (Int value 0-1000)

```swift
RatingsRestrictionKit.getDeviceMovieRestriction()
```
Returns value of Movie Rating Restriction on Device (String value unrestricted, nc17, r, pg13, pg, g, disallow)

#### Get Movie Rating Value

```swift
RatingsRestrictionKit.getMovieRatingValue(rating: "r") // 400
```
Returns raw value of supplied Movie Rating (Int value 0-1000)

#### Movie Rating is Allowed

```swift
RatingsRestrictionKit.movieRatingIsAllowed(rating: "r") // returns Bool
```
Returns true/false if supplied rating is allowed by device's movie restriction rating

## Installation

**RatingsRestrictionKit** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RatingsRestrictionKit'
```

## Features Planned

-   [ ] TV Show Ratings
-   [ ] App Ratings
-   [ ] Explicit Books Allowed
-   [ ] Explicit Music Podcasts Allowed

## Wish List (For Those That Wish To Contribute)

-   [ ] Support for Countries outside of US