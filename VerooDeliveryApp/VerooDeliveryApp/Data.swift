//
//  Data.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 06/05/22.
//

class Data {
    
    // Data for profile screen
    static let profileData = [
        ProfileDataClass(image: R.image.location, title: R.string.localizable.address()),
        ProfileDataClass(image: R.image.favourites, title: R.string.localizable.favourites()),
        ProfileDataClass(image: R.image.lock, title: R.string.localizable.orders()),
        ProfileDataClass(image: R.image.files, title: R.string.localizable.payment()),
        ProfileDataClass(image: R.image.chat, title: R.string.localizable.contact())
    ]
    
    // Data for onboarding screen
    static let onBoardingData = [
        OnboardingDataClass(image: R.image.imageOne, title: R.string.localizable.titleOne(), subtitle: R.string.localizable.subtitleOne()),
        OnboardingDataClass(image: R.image.imageTwo, title: R.string.localizable.titleTwo(), subtitle: R.string.localizable.subtitleTwo()),
        OnboardingDataClass(image: R.image.imageOne, title: R.string.localizable.titleOne(), subtitle: R.string.localizable.subtitleOne()),
    ]
    
}
