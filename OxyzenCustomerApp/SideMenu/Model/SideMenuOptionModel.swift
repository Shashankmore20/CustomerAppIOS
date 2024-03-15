//
//  SideMenuOptionModel.swift
//  OxyzenCustomerApp
//
//  Created by Shashank More on 27/02/24.
//

import Foundation

enum SideMenuOptionModel:  Int, CaseIterable {
case MyPaymnets
case MyRecipts
case MyOutstanding
case MyComplaints
case MyClaims
case MyRewards
case MyOffers
case MyEContract
case MyKyc
case SetAlerts
case EasyCall
case RateExperience
case ReferFriend
case MyProfile
case MySettings
case MyMessages
case GetHelp
case AboutUs
case Home
case TandC
case Faqs
case WhatNew
case AdvertismentTest
case LogOut
    
    var title: String {
        switch self {
        case.MyPaymnets:
            return "My Payments"
        case.MyRecipts:
            return "My Receipts"
        case.MyOutstanding:
            return "My Outstanding"
        case.MyComplaints:
            return "My Complaints"
        case.MyClaims:
            return "My Claims"
        case.MyRewards:
            return "My Rewards"
        case.MyOffers:
            return "My Offers"
        case.MyEContract:
            return "My E-Contract"
        case.MyKyc:
            return "My KYC"
        case.SetAlerts:
            return "Set Alerts"
        case.EasyCall:
            return "Easy Call"
        case.RateExperience:
            return "Rate My Experience"
        case.ReferFriend:
            return "Refer a Friend"
        case.MyProfile:
            return "My Profile"
        case.MySettings:
            return "My Settings"
        case.MyMessages:
            return "My Messages"
        case.GetHelp:
            return "Get Help"
        case.AboutUs:
            return "About Us"
        case.Home:
            return "Home"
        case.TandC:
            return "T&C"
        case.Faqs:
            return "FAQs"
        case.WhatNew:
            return "What's New"
        case.AdvertismentTest:
            return "Advert/Tetimonial Banners"
        case.LogOut:
            return "Log Out"
        }
    }
    
    var systemImageName: String {
        switch self {
        case.MyPaymnets:
            return "creditcard"
        case.MyRecipts:
            return "newspaper"
        case.MyOutstanding:
            return "indianrupeesign.circle"
        case.MyComplaints:
            return "square.and.pencil"
        case.MyClaims:
            return "chart.bar"
        case.MyRewards:
            return "gift"
        case.MyOffers:
            return "app.gift"
        case.MyEContract:
            return "doc.on.doc"
        case.MyKyc:
            return "indianrupeesign.square"
        case.SetAlerts:
            return "bell.and.waveform"
        case.EasyCall:
            return "person.line.dotted.person"
        case.RateExperience:
            return "microbe"
        case.ReferFriend:
            return "person.badge.plus"
        case.MyProfile:
            return "person.circle"
        case.MySettings:
            return "gearshape.2"
        case.MyMessages:
            return "envelope"
        case.GetHelp:
            return "questionmark.circle.fill"
        case.AboutUs:
            return "person.crop.circle.badge.questionmark"
        case.Home:
            return "house.circle"
        case.TandC:
            return "newspaper.circle"
        case.Faqs:
            return "questionmark.app"
        case.WhatNew:
            return "plus.circle"
        case.AdvertismentTest:
            return "rectangle.stack.badge.plus"
        case.LogOut:
            return "rectangle.portrait.and.arrow.right"
        }
    }
    
    func performAction(){
        switch self {
        case.LogOut:
            logout()
        default:
            break
        }
    }
    
    private func logout() {
        Auth.shared.logout()
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int {return self.rawValue}
}
