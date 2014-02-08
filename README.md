NTAnalytics
===========

A provider-based Analytics framework.

NTAnalytics is a provider-based analytics framework. Using NTAnalytics to record events in your code allows you to add or remove specific Analytcs systems (such as Flurry of Google) without changing your entire codebase.

Currently Flurry and Google Analytics (2.0) Analytics providers are implemented. The focus is on a common set of features - based on recording analytics events. (The "page-view" model is not currently supported.)

To Do
-----

There are only a few providers currently, more need to be added! Additionally, the Google provider is using an old version of the Google Analytics package and needs to be updated to the latest and greatest.

CocoaPods Installation
======================

This podspec is implmented using submodules. The Core subspec includes the common code. Additional subspecs are included for each privider, currently Google and Flurry. Google and Flurry will include all required dependencies, including the API's and NTAnalytics/Core.

Examples:

	pod 'NTAnalytics/Google'
	pod 'NTAnalytics/Flurry'


Old School Installation
=======================

Include the files in the 'Core' folder to get the ain NTAnalytics funcitonality. Include any of the provider floders (Flurry, Google) to add support the the corresponding provider.