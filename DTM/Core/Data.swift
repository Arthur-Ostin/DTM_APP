//
//  Data.swift
//  DTM
//
//  Created by Code Whiz on 11/10/24.
//

import SwiftUI
let faculties = ["🌍 Arts","🔬 Science","💼 Desautels Management","💻 Computing Studies","🦷 Dental Medicine","📚 Education","🛠 Engineering","🧠 Interfaculty B.A. & Sc.","⚖️ Law","🩺 Medicine","🎵 Schulich Music"]
let goOutOften = ["🌞 Everyday","🍻 5-6 times a week","🎟 3-4 times a week","🎶 Twice a week","🎉 Once a week","🌙 Sometimes","🗒 Rarely"]


//MARK: Used on ONBOARD5 FOR MUSIC
let musicGenre1 = ["Hip Hop","Rock","Pop","Alternative","Indie"]
let musicGenre2 = ["Jazz","Classical","Country","Metal","Latin"]
let musicGenre3 = ["R & B","Chill","Grime","Reggae","60s-90s"]
let musicGenre4 = ["Techno","Electronic","Deep house","EDM"]
let musicGenre5 = ["Chillwave","Afrobeats","House","Trance"]
let musicGenre6 = ["Dance","DnB","Tropical house","Breakbeat"]


struct Constants {
    static let Secondary: Color = Color(red: 0.1, green: 0.2, blue: 0.45)
    static let ContentGrey: Color = Color(red: 0.51, green: 0.51, blue: 0.51)
    static let InfoGrey: Color = Color(red: 0.66, green: 0.66, blue: 0.66)
    static let GraysWhite: Color = .white
    static let StrokeBorder: CGFloat = 1
    static let PlaceholderGrey: Color = Color(red: 0.86, green: 0.86, blue: 0.86)
    static let ContentBlack: Color = Color(red: 0, green: 0.02, blue: 0.03)
    static let BackgoroundGrey: Color = Color(red: 0.97, green: 0.97, blue: 0.97)
    static let SelectedColour: Color = Color(red: 0.95, green: 0.76, blue: 0.82)
    static let BorderGrey: Color = Color(red: 0.76, green: 0.76, blue: 0.76)
    static let disableGrey: Color = Color(red: 0.93, green: 0.93, blue: 0.93)
}

//MARK: Used on ONBOARD3 FOR COUNTRIES
let allItems = [
    ["🇨🇦", "🇺🇸", "🇫🇷", "🇬🇧", "🇨🇳", "🇦🇫", "🇦🇱", "🇩🇿", "🇦🇩", "🇦🇴", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇯", "🇧🇹", "🇧🇴", "🇧🇦", "🇧🇼", "🇧🇷", "🇧🇳", "🇧🇬", "🇧🇫", "🇧🇮", "🇨🇻", "🇰🇭", "🇨🇲", "🇨🇫", "🇹🇩", "🇨🇱", "🇨🇴", "🇰🇲", "🇨🇬", "🇨🇩", "🇨🇷", "🇭🇷", "🇨🇺", "🇨🇾", "🇨🇿", "🇩🇰", "🇩🇯", "🇩🇲", "🇩🇴", "🇪🇨", "🇪🇬", "🇸🇻", "🇬🇶", "🇪🇷", "🇪🇪", "🇪🇹", "🇫🇯", "🇫🇮", "🇬🇦", "🇬🇲", "🇬🇪", "🇩🇪", "🇬🇭", "🇬🇷", "🇬🇩", "🇬🇹", "🇬🇳", "🇬🇼", "🇬🇾", "🇭🇹", "🇭🇳", "🇭🇺", "🇮🇸", "🇮🇳", "🇮🇩", "🇮🇷", "🇮🇶", "🇮🇪", "🇮🇱", "🇮🇹", "🇯🇲", "🇯🇵", "🇯🇴", "🇰🇿", "🇰🇪", "🇰🇮", "🇰🇵", "🇰🇷", "🇽🇰", "🇰🇼", "🇰🇬", "🇱🇦", "🇱🇻", "🇱🇧", "🇱🇸", "🇱🇷", "🇱🇾", "🇱🇮", "🇱🇹", "🇱🇺", "🇲🇬", "🇲🇼", "🇲🇾", "🇲🇻", "🇲🇱", "🇲🇹", "🇲🇭", "🇲🇷", "🇲🇺", "🇲🇽", "🇫🇲", "🇲🇩", "🇲🇨", "🇲🇳", "🇲🇪", "🇲🇦", "🇲🇿", "🇲🇲", "🇳🇦", "🇳🇷", "🇳🇵", "🇳🇱", "🇳🇿", "🇳🇮", "🇳🇪", "🇳🇬", "🇲🇰", "🇳🇴", "🇴🇲", "🇵🇰", "🇵🇼", "🇵🇸", "🇵🇦", "🇵🇬", "🇵🇾", "🇵🇪", "🇵🇭", "🇵🇱", "🇵🇹", "🇶🇦", "🇷🇴", "🇷🇺", "🇷🇼", "🇰🇳", "🇱🇨", "🇻🇨", "🇼🇸", "🇸🇲", "🇸🇹", "🇸🇦", "🇸🇳", "🇷🇸", "🇸🇨", "🇸🇱", "🇸🇬", "🇸🇰", "🇸🇮", "🇸🇧", "🇸🇴", "🇿🇦", "🇪🇸", "🇱🇰", "🇸🇩", "🇸🇷", "🇸🇪", "🇨🇭", "🇸🇾", "🇹🇼", "🇹🇯", "🇹🇿", "🇹🇭", "🇹🇱", "🇹🇬", "🇹🇴", "🇹🇹", "🇹🇳", "🇹🇷", "🇹🇲", "🇹🇻", "🇺🇬", "🇺🇦", "🇦🇪", "🇺🇾", "🇺🇿", "🇻🇺", "🇻🇦", "🇻🇪", "🇻🇳", "🇾🇪", "🇿🇲", "🇿🇼"],
    ["Canada", "U.S", "France", "United Kingdom", "China", "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon", "Central African Republic", "Chad", "Chile", "Colombia", "Comoros", "Congo (Congo-Brazzaville)", "Congo (Congo-Kinshasa)", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czechia", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "North Korea", "South Korea", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar (Burma)", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "São Tomé and Príncipe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"],
    ["1", "1", "33", "44", "86", "93", "355", "213", "376", "244", "1-268", "54", "374", "61", "43", "994", "1-242", "973", "880", "1-246", "375", "32", "501", "229", "975", "591", "387", "267", "55", "673", "359", "226", "257", "238", "855", "237", "236", "235", "56", "57", "269", "242", "243", "506", "385", "53", "357", "420", "45", "253", "1-767", "1-809, 1-829, 1-849", "593", "20", "503", "240", "291", "372", "251", "679", "358", "241", "220", "995", "49", "233", "30", "1-473", "502", "224", "245", "592", "509", "504", "36", "354", "91", "62", "98", "964", "353", "972", "39", "1-876", "81", "962", "7", "254", "686", "850", "82", "383", "965", "996", "856", "371", "961", "266", "231", "218", "423", "370", "352", "261", "265", "60", "960", "223", "356", "692", "222", "230", "52", "691", "373", "377", "976", "382", "212", "258", "95", "264", "674", "977", "31", "64", "505", "227", "234", "389", "47", "968", "92", "680", "970", "507", "675", "595", "51", "63", "48", "351", "974", "40", "7", "250", "1-869", "1-758", "1-784", "685", "378", "239", "966", "221", "381", "248", "232", "65", "421", "386", "677", "252", "27", "34", "94", "249", "597", "46", "41", "963", "886", "992", "255", "66", "670", "228", "676", "1-868", "216", "90", "993", "688", "256", "380", "971", "598", "998", "678", "379", "58", "84", "967", "260", "263"]
]


//MARK: Used on ONBOARD6 FOR PASSIONS
let socialOptions = ["Darties", "Raves", "OAP", "Pubs", "Festivals", "Dinner Parties", "Concerts", "4a7", "Karaoke", "Clubbing", "Wine n Dine", "BDA", "House Party"]
let interestOptions = [
    "Reading", "Poetry", "Elevative Art", "Writing",
    "Photography", "Museums", "Art", "Anime",
    "Nature", "Fashion", "Formula 1", "Trainspotting",
    "Volunteering", "Entrepreneurship", "Music",
    "Food", "Films", "Podcasts", "Music Production",
    "Astronomy", "Psychology", "Politics",
    "Philosophy", "Sport", "Cold water swimming"
]

let activitiesOptions = [
    "Camping",
    "Hiking",
    "Backpacking",
    "Road Trips",
    "Beach", "Thrifting", "Cooking",
    "Board", "Games", "Chess", "Table Tennis",
    "Gaming", "Acting", "Drawing", "Painting",
    "Djing", "Meditation", "Thrifting", "Partying"
]

let sportsOptions = [
    "Badminton", "Rugby", "Basketball", "Tennis", "Lacrosse", "Volleyball", "Baseball", "Rugby",
    "Football", "Soccer", "Handball", "Softball", "Boxing", "Athletics", "Martial Arts", "Pilates",
    "Cycling", "Gym/Fitness", "Yoga", "Running", "Canoeing", "Rowing", "Ice Hockey", "Climbing",
    "Ice Skating", "Mountain Biking", "Snowboarding", "Surfing", "Skiing", "Skateboarding",
    "Sailing", "Dance", "Bouldering", "Darts", "Fencing", "Golf", "Roller Skating", "Shooting",
    "Spikeball", "Squash", "Ultimate Frisbee", "Quidditch"
]
