//
//  iOSRestrictions.swift
//  RatingsRestrictionKit
//
//  Created by Justin Kumpe on 11/29/20.
//

import Foundation

    /// Gets Device's movie restriction setting as raw value
    public func getDeviceMovieRestrictionRaw() -> Int {
        let movieRestrictionSetting = UserDefaults.standard.object(forKey: "com.apple.content-rating.MovieRating") as? Int ?? 1000
        return movieRestrictionSetting
    }

    /// Gets Device's movie restriction setting as name (US)
    public func getDeviceMovieRestriction() -> String {
        let movieRestrictionSetting = UserDefaults.standard.object(forKey: "com.apple.content-rating.MovieRating") as? Int ?? 1000
        switch movieRestrictionSetting {
        case 1000:
            return "unrestricted"
        case 500:
            return "nc17"
        case 400:
            return "r"
        case 300:
            return "pg13"
        case 200:
            return "pg"
        case 100:
            return "g"
        case 0:
            return "disallow"
        default:
            return "unknown"
        }
    }

    /// Get iOS raw value of movie rating (US)
    public func getMovieRatingValue(rating: String) -> Int {
        let movieRating = rating.lowercased()
        let cleanedMovieRating = movieRating.replacingOccurrences(of: "-", with: "")
        switch cleanedMovieRating {
        case "g":
            return 100
        case "pg":
            return 200
        case "pg13":
            return 300
        case "r":
            return 400
        case "nc17":
            return 500
        default:
            return 1000
        }
    }

    /// True if supplied rating is allowed per device settings
    public func movieRatingIsAllowed(rating: String) -> Bool {
        let ratingRawValue = getMovieRatingValue(rating: rating)
        let allowedRatingRawValue = getDeviceMovieRestrictionRaw()
        return allowedRatingRawValue >= ratingRawValue
    }
