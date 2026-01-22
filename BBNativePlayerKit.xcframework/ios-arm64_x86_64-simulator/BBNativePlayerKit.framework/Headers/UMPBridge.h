//
//  UMPBridge.h
//  BBNativePlayerKit
//
//  Created by Claude Code under the professional guidance of Olaf Timme on 2026-01-08.
//  Copyright (c) Blue Billywig. All rights reserved.
//
//  Bridge for Google User Messaging Platform (UMP) SDK.
//  Removes compile-time dependency by using runtime class lookups.
//  Supports both UMP 2.x and 3.x with automatic version detection.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// Error domain for UMPBridge errors
extern NSString * const UMPBridgeErrorDomain;

/// Error codes for UMPBridge
typedef NS_ENUM(NSInteger, UMPBridgeError) {
    UMPBridgeErrorUMPNotAvailable = 1001,
    UMPBridgeErrorClassNotFound = 1002,
    UMPBridgeErrorSelectorNotFound = 1003,
    UMPBridgeErrorMethodInvocationFailed = 1004,
    UMPBridgeErrorInvalidViewController = 1005
};

/// Consent status values matching UMP SDK
typedef NS_ENUM(NSInteger, UMPBridgeConsentStatus) {
    UMPBridgeConsentStatusUnknown = 0,
    UMPBridgeConsentStatusRequired = 1,
    UMPBridgeConsentStatusNotRequired = 2,
    UMPBridgeConsentStatusObtained = 3
};

/// Debug geography values matching UMP SDK
typedef NS_ENUM(NSInteger, UMPBridgeDebugGeography) {
    UMPBridgeDebugGeographyDisabled = 0,
    UMPBridgeDebugGeographyEEA = 1,
    UMPBridgeDebugGeographyNotEEA = 2
};

/**
 * @brief Bridge for Google User Messaging Platform (UMP) SDK.
 *
 * This bridge removes compile-time dependency on UMP SDK by using runtime class lookups.
 * Supports both UMP 2.x and 3.x with automatic version detection.
 *
 * @discussion All methods ensure execution on main thread. Completion handlers are called on main thread.
 *
 * @note If UMP SDK is not linked by the host app, all methods degrade gracefully:
 *       - isUMPAvailable returns NO
 *       - consentStatus returns Unknown
 *       - canRequestAds returns NO
 *       - Completion handlers are called with appropriate errors
 *
 * @warning Do not call these methods directly from background threads.
 */
@interface UMPBridge : NSObject

/**
 * Checks if UMP SDK is available at runtime.
 * @return YES if UMP classes can be found, NO otherwise
 */
+ (BOOL)isUMPAvailable;

/**
 * Detects UMP SDK version.
 * @return YES if UMP 3.x is detected, NO if 2.x or unavailable
 */
+ (BOOL)isUMP3x;

/**
 * Gets current consent status.
 * @return Consent status, or Unknown if UMP unavailable
 */
+ (UMPBridgeConsentStatus)consentStatus;

/**
 * Checks if ads can be requested based on consent state.
 * @return YES if ads are allowed, NO otherwise or if UMP unavailable
 */
+ (BOOL)canRequestAds;

/**
 * Requests consent information update from UMP SDK.
 *
 * @param tagForUnderAge Whether user is tagged as under age of consent
 * @param debugGeography Debug geography setting. Only applies on simulator.
 * @param completion Completion handler called on main thread with error or nil on success
 *
 * @note Automatically dispatches to main thread if called from background thread
 * @note Returns error if UMP unavailable
 */
+ (void)requestConsentInfoUpdateWithTagForUnderAge:(BOOL)tagForUnderAge
                                    debugGeography:(UMPBridgeDebugGeography)debugGeography
                                        completion:(nullable void(^)(NSError * _Nullable error))completion
    NS_SWIFT_NAME(requestConsentInfoUpdate(withTagForUnderAge:debugGeography:completion:));

/**
 * Loads and presents consent form if required.
 *
 * @param viewController View controller to present from
 * @param completion Completion handler called on main thread with error or nil on success
 *
 * @note Automatically dispatches to main thread if called from background thread
 * @note Returns error if UMP unavailable
 */
+ (void)loadAndPresentConsentFormFromViewController:(UIViewController *)viewController
                                         completion:(nullable void(^)(NSError * _Nullable error))completion
    NS_SWIFT_NAME(loadAndPresentConsentForm(from:completion:));

/**
 * Resets consent information (for testing purposes).
 *
 * @warning Only use in debug/simulator builds. Do not call in production.
 */
+ (void)resetConsentInformation;

@end

NS_ASSUME_NONNULL_END
