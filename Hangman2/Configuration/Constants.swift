//
//  Constants.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 03.11.2022..
//

import SwiftUI

enum Constants {

   // swiftlint:disable: line_length
   enum Alphabet {
      static let english   = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] // 26
      static let croatian  = ["A", "B", "C", "Č", "Ć", "D", "DŽ", "Đ", "E", "F", "G", "H", "I", "J", "K", "L", "LJ", "M", "N", "NJ", "O", "P", "R", "S", "Š", "T", "U", "V", "Z", "Ž"] // 30
   }

   enum Colors {
      static let azulPetroleo       = Color("azulPetroleo")       // Color(red: 054/255, green: 072/255, blue: 080/255)
      static let blackBox           = Color("blackBox")           // Color(red: 012/255, green: 039/255, blue: 049/255)
      static let blueHeath          = Color("blueHeath")          // Color(red: 082/255, green: 106/255, blue: 251/255)
      static let bluewood           = Color("bluewood")           // Color(red: 036/255, green: 056/255, blue: 065/255)
      static let carmine            = Color("carmine")            // Color(red: 168/255, green: 059/255, blue: 060/255)
      static let carnation          = Color("carnation")          // Color(red: 240/255, green: 072/255, blue: 086/255)
      static let dugong             = Color("dugong")             // Color(red: 112/255, green: 112/255, blue: 112/255)
      static let ebonyClay          = Color("ebonyClay")          // Color(red: 034/255, green: 042/255, blue: 049/255)
      static let ebonyClaySolo      = Color("ebonyClaySolo")      // Color(red: 034/255, green: 042/255, blue: 049/255)
      static let galeForce          = Color("galeForce")          // Color(red: 255/255, green: 255/255, blue: 255/255)
      static let juanSan            = Color("juanSan")
      static let limedSpruce        = Color("limedSpruce")        // Color(red: 062/255, green: 081/255, blue: 089/255)
      static let mintLeaf           = Color("mintLeaf")           // Color(red: 000/255, green: 209/255, blue: 175/255)
      static let purpleHeart        = Color("purpleHeart")        // Color(red: 075/255, green: 058/255, blue: 201/255)
      static let riverBed           = Color("riverBed")           // Color(red: 066/255, green: 080/255, blue: 089/255)
      static let sanJuan            = Color("sanJuan")            // Color(red: 069/255, green: 088/255, blue: 096/255)
      static let seaDeep            = Color("seaDeep")            // Color(red: 043/255, green: 062/255, blue: 071/255)
      static let watermelon         = Color("watermelon")         // Color(red: 255/255, green: 115/255, blue: 123/255)
      static let white              = Color.white
   }

   enum Fonts {
      static let dangerL            = Font.custom("Another Danger - Demo", size: 28)
      static let dangerXL           = Font.custom("Another Danger - Demo", size: 36)

      static let patrickHand3XS     = Font.custom("PatrickHand-Regular", size: 14)
      static let patrickHand2XS     = Font.custom("PatrickHand-Regular", size: 16)
      static let patrickHandXS      = Font.custom("PatrickHand-Regular", size: 18)
      static let patrickHandS       = Font.custom("PatrickHand-Regular", size: 20)
      static let patrickHand        = Font.custom("PatrickHand-Regular", size: 22)
      static let patrickHandM       = Font.custom("PatrickHand-Regular", size: 24)
      static let patrickHandL       = Font.custom("PatrickHand-Regular", size: 26)
      static let patrickHandXL      = Font.custom("PatrickHand-Regular", size: 36)
      static let patrickHand2XL     = Font.custom("PatrickHand-Regular", size: 38)
      static let patrickHand3XL     = Font.custom("PatrickHand-Regular", size: 40)
   }

   enum Images {
      static let about                       = "about"
      static let back                        = "back"
      static let backgroundGame              = "background_game"
      static let backgroundStart             = "background_start"
      static let character1                  = "character1"
      static let character2                  = "character2"
      static let character3                  = "character3"
      static let character4                  = "character4"
      static let character5                  = "character5"
      static let character6                  = "character6"
      static let character7                  = "character7"
      static let character8                  = "character8"
      static let check                       = "check"
      static let forward                     = "forward"
      static let forwardRed                  = "forward_red"
      static let github                      = "github"
      static let highScores                  = "high_scores"
      static let info                        = "info"
      static let instagram                   = "instagram"
      static let linkedIn                    = "linkedin"
      static let lightbulbFill               = "lightbulb.fill"
      static let lightbulbSlashFill          = "lightbulb.slash.fill"
      static let logoAppName                 = "logo_app_name"
      static let logoAppMock                 = "logo_app_mock"
      static let mePortrait                  = "me_portrait"
      static let moonFill                    = "moon.fill"
      static let score                       = "score"
      static let settings                    = "settings"
      static let statistics                  = "statistics"
      static let sunMaxFill                  = "sun.max.fill"
      static let timer                       = "timer"
      static let twitter                     = "twitter"
      static let website                     = "website"
      static let youtube                     = "youtube"
   }

   enum LanguageApp {
      static let english            = Language.english
      static let croatian           = Language.croatian
   }

   enum LanguageWords {
      static let croatian           = Language.croatian
      static let english            = Language.english
   }

   enum Links {
      static let blog               = "https://github.com/hrvoje0099/"
      static let gitHub             = "https://github.com/hrvoje0099/"
      static let instagram          = "https://github.com/hrvoje0099/"
      static let linkedIn           = "https://www.linkedin.com/in/hrvoje-vukovic/"
      static let twitter            = "https://twitter.com/hrvoje0099"
      static let youTube            = "https://www.youtube.com/channel/UCVSR4hGOSUY2JOd1QFHE_Yw"
   }

   enum LocalisedString {
      static let about                       = LocalizedStringKey("ABOUT")
      static let appDevelopmentProcess       = LocalizedStringKey("APP_DEVELOPMENT_PROCESS")
      static let appLanguage                 = LocalizedStringKey("APP_LANGUAGE")
      static let application                 = LocalizedStringKey("APPLICATION")
      static let chooseAppLanguage           = LocalizedStringKey("CHOOSE_APP_LANGUAGE")
      static let chooseDifficulty            = LocalizedStringKey("CHOOSE_DIFFICULTY")
      static let chooseWordsLanguage         = LocalizedStringKey("CHOOSE_WORDS_LANGUAGE")
      static let contactMe                   = LocalizedStringKey("CONTACT_ME")
      static let contactReportInfo           = LocalizedStringKey("CONTACT_REPORT_INFO")
      static let croatian                    = LocalizedStringKey("CROATIAN")
      static let croatianWords               = LocalizedStringKey("CROATIAN_WORDS")
      static let darkMode                    = LocalizedStringKey("DARK_MODE")
      static let date                        = LocalizedStringKey("DATE")
      static let dashDateOfPlaying           = LocalizedStringKey("DASH_DATE_OF_PLAYING")
      static let dashDifficultyLevel         = LocalizedStringKey("DASH_DIFFICULTY_LEVEL")
      static let dashTotalPlayingTime        = LocalizedStringKey("DASH_TOTAL_PLAYING_TIME")
      static let dashTotalScore              = LocalizedStringKey("DASH_TOTAL_SCORE")
      static let dashWinLoseRatio            = LocalizedStringKey("DASH_WIN_LOSE_RATIO")
      static let difficulty                  = LocalizedStringKey("DIFFICULTY")
      static let difficultyLevels            = LocalizedStringKey("DIFFICULTY_LEVELS")
      static let difficultyEasy              = LocalizedStringKey("DIFFICULTY_EASY")
      static let difficultyMedium            = LocalizedStringKey("DIFFICULTY_MEDIUM")
      static let difficultyHard              = LocalizedStringKey("DIFFICULTY_HARD")
      static let easy                        = LocalizedStringKey("EASY")
      static let easyDifficultyLength        = LocalizedStringKey("EASY_DIFFICULTY_LENGTH")
      static let emailStatusCancelled        = LocalizedStringKey("EMAIL_STATUS_CANCELLED")
      static let emailStatusFailed           = LocalizedStringKey("EMAIL_STATUS_FAILED")
      static let emailStatusSaved            = LocalizedStringKey("EMAIL_STATUS_SAVED")
      static let emailStatusSent             = LocalizedStringKey("EMAIL_STATUS_SENT")
      static let emailStatusUnknown          = LocalizedStringKey("EMAIL_STATUS_UNKNOWN")
      static let english                     = LocalizedStringKey("ENGLISH")
      static let englishWords                = LocalizedStringKey("ENGLISH_WORDS")
      static let exitWillLoseGameProgress    = LocalizedStringKey("EXIT_WILL_LOSE_GAME_PROGRESS")
      static let featureRequest              = LocalizedStringKey("FEATURE_REQUEST")
      static let gameLost                    = LocalizedStringKey("GAME_LOST")
      static let gameWin                     = LocalizedStringKey("GAME_WIN")
      static let hard                        = LocalizedStringKey("HARD")
      static let hardDifficultyLength        = LocalizedStringKey("HARD_DIFFICULTY_LENGTH")
      static let highScores                  = LocalizedStringKey("HIGH_SCORES")
      static let highestScore                = LocalizedStringKey("HIGHEST_SCORE")
      static let hits                        = LocalizedStringKey("HITS")
      static let info                        = LocalizedStringKey("INFO")
      static let language                    = LocalizedStringKey("LANGUAGE")
      static let languageInfo                = LocalizedStringKey("LANGUAGE_INFO")
      static let listOfAllWords              = LocalizedStringKey("LIST_OF_ALL_WORDS")
      static let listOfAllWordsInfo          = LocalizedStringKey("LIST_OF_ALL_WORDS_INFO")
      static let longestGame                 = LocalizedStringKey("LONGEST_GAME")
      static let losses                      = LocalizedStringKey("LOSSES")
      static let medium                      = LocalizedStringKey("MEDIUM")
      static let mediumDifficultyLength      = LocalizedStringKey("MEDIUM_DIFFICULTY_LENGTH")
      static let misc                        = LocalizedStringKey("MISC")
      static let no                          = LocalizedStringKey("NO")
      static let ok                          = LocalizedStringKey("OK")
      static let options                     = LocalizedStringKey("OPTIONS")
      static let overview                    = LocalizedStringKey("OVERVIEW")
      static let perfectWins                 = LocalizedStringKey("PERFECT_WINS")
      static let play                        = LocalizedStringKey("PLAY")
      static let played                      = LocalizedStringKey("PLAYED")
      static let quitTheGame                 = LocalizedStringKey("QUIT_THE_GAME")
      static let ratio                       = LocalizedStringKey("RATIO")
      static let reportBug                   = LocalizedStringKey("REPORT_BUG")
      static let rightLetter                 = LocalizedStringKey("RIGHT_LETTER")
      static let score                       = LocalizedStringKey("SCORE")
      static let scoringSystem               = LocalizedStringKey("SCORING_SYSTEM")
      static let selectGameDifficultyLvl     = LocalizedStringKey("SELECT_GAME_DIFFICULTY_LVL")
      static let settings                    = LocalizedStringKey("SETTINGS")
      static let showHint                    = LocalizedStringKey("SHOW_HINT")
      static let statistics                  = LocalizedStringKey("STATISTICS")
      static let time                        = LocalizedStringKey("TIME")
      static let topFiveScores               = LocalizedStringKey("TOP_FIVE_SCORES")
      static let totalTime                   = LocalizedStringKey("TOTAL_TIME")
      static let twoPlayers                  = LocalizedStringKey("TWO_PLAYERS")
      static let unableToSendEmail           = LocalizedStringKey("UNABLE_TO_SEND_EMAIL")
      static let winRate                     = LocalizedStringKey("WIN_RATE")
      static let winRateInfo                 = LocalizedStringKey("WIN_RATE_INFO")
      static let wins                        = LocalizedStringKey("WINS")
      static let wordLengthPerLevel          = LocalizedStringKey("WORD_LENGTH_PER_LEVEL")
      static let words                       = LocalizedStringKey("WORDS")
      static let wordsLanguage               = LocalizedStringKey("WORDS_LANGUAGE")
      static let wrongGuesses                = LocalizedStringKey("WRONG_GUESSES")
      static let wrongLetter                 = LocalizedStringKey("WRONG_LETTER")
      static let yes                         = LocalizedStringKey("YES")
      static let yourTopHighScores           = LocalizedStringKey("YOUR_TOP_HIGH_SCORES")
   }

   enum NonLocalisedString {
      static let blog                        = "Blog"
      static let gitHub                      = "GitHub"
      static let instagram                   = "Instagram"
      static let linkedIn                    = "LinkedIn"
      static let twitter                     = "Twitter"
      static let youtube                     = "YouTube"
   }

   enum Request {
      static let baseURL      = "https://hrvoje0099.github.io/"
   }

   enum WordsMock {
      static let words = [
         Word(word: "bad", hint: "bad things happen", difficulty: 1),
         Word(word: "error", hint: "bad things happen", difficulty: 2),
         Word(word: "disaster", hint: "bad things happen", difficulty: 3)
      ]
   }
}
