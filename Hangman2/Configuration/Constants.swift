//
//  Constants.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 03.11.2022..
//

import Foundation
import SwiftUI

enum Constants {

   enum Colors {
      static let blackBox           = Color("blackBox")           // Color(red: 12/255, green: 39/255, blue: 49/255)
      static let carnationRed       = Color(#colorLiteral(red: 0.9411764706, green: 0.2823529412, blue: 0.337254902, alpha: 1))                   // Color(red: 240/255, green: 72/255, blue: 86/255)
      static let mintLeaf           = Color(#colorLiteral(red: 0, green: 0.8196078431, blue: 0.6862745098, alpha: 1))                   // Color(red: 0/255, green: 209/255, blue: 175/255)
      static let sanJuan            = Color(#colorLiteral(red: 0.2705882353, green: 0.3450980392, blue: 0.3764705882, alpha: 1))                   // Color(red: 69/255, green: 88/255, blue: 96/255)
      static let seeDeepBlue        = Color("seeDeepBlue")        // Color(red: 43/255, green: 62/255, blue: 71/255, alpha: 0.6)
      static let stoneGranit        = Color("stoneGranit")        // Color(red: 62/255, green: 81/255, blue: 89/255, alpha: 0.8)
      static let textColor          = Color("textColor")          //
      static let toggleBackground   = Color("toggleBackground")   // Color(red: 55/255, green: 69/255, blue: 76/255)
      static let watermelon         = Color(#colorLiteral(red: 1, green: 0.4508367777, blue: 0.4819011092, alpha: 1))                   // Color(red: 255/255, green: 90/255, blue: 104/255)
      static let winRate            = Color("winRate")            //
      static let woodBlue           = Color("woodBlue")           // Color(red: 32/255, green: 56/255, blue: 65/255)
   }

   enum Fonts {
      static let dangerM         = Font.custom("Another Danger - Demo", size: 18)
      static let dangerL         = Font.custom("Another Danger - Demo", size: 28)
      static let dangerXL        = Font.custom("Another Danger - Demo", size: 36)

      static let patrickHandXS   = Font.custom("PatrickHand-Regular", size: 16)
      static let patrickHand     = Font.custom("PatrickHand-Regular", size: 20)
      static let patrickHandM    = Font.custom("PatrickHand-Regular", size: 22)
      static let patrickHandL    = Font.custom("PatrickHand-Regular", size: 24)
      static let patrickHandXXXL = Font.custom("PatrickHand-Regular", size: 36)
   }

   enum GameDifficulty {
      static let easy            = Difficulty(level: "easy", localised: LocalisedString.easy)
      static let medium          = Difficulty(level: "medium", localised: LocalisedString.medium)
      static let hard            = Difficulty(level: "hard", localised: LocalisedString.hard)
   }

   enum Images {
      static let back                        = "back"
      static let check                       = "check"
      static let forward                     = "forward"
      static let forwardRed                  = "forward_red"
      static let github                      = "github"
      static let highScores                  = "high_scores"
      static let linkedIn                    = "linkedin"
      static let lightbulbFill               = "lightbulb.fill"
      static let lightbulbSlashFill          = "lightbulb.slash.fill"
      static let logoAppName                 = "logo_app_name"
      static let logoAppMock                 = "logo_app_mock"
      static let moonFill                    = "moon.fill"
      static let settings                    = "settings"
      static let startBackground             = "start_background"
      static let sunMaxFill                  = "sun.max.fill"
   }

   enum LocalisedString {
      static let about                       = "ABOUT"
      static let application                 = "APPLICATION"
      static let chooseWordsLanguage         = "CHOOSE_WORDS_LANGUAGE"
      static let combineDifficultyLevels     = "COMBINE_DIFFICULTY_LEVELS";      #warning("ne koristim")
      static let contactMe                   = "CONTACT_ME"
      static let contactReportInfo           = "CONTACT_REPORT_INFO"
      static let croatian                    = "CROATIAN"
      static let darkMode                    = "DARK_MODE"
      static let difficultyExample           = "DIFFICULTY_EXAMPLE";             #warning("ne koristim")
      static let difficultyLevel             = "DIFFICULTY_LEVEL"
      static let easy                        = "EASY"
      static let english                     = "ENGLISH"
      static let featureRequest              = "FEATURE_REQUEST"
      static let hard                        = "HARD"
      static let highScores                  = "HIGH_SCORES"
      static let language                    = "LANGUAGE"
      static let listOfAllWords              = "LIST_OF_ALL_WORDS"
      static let medium                      = "MEDIUM"
      static let misc                        = "MISC"
      static let options                     = "OPTIONS"
      static let play                        = "PLAY"
      static let reportBug                   = "REPORT_BUG"
      static let select                      = "SELECT"
      static let selectGameDifficultyLvl     = "SELECT_GAME_DIFFICULTY_LVL"
      static let settings                    = "SETTINGS"
      static let showHint                    = "SHOW_HINT"
      static let statistics                  = "STATISTICS"
      static let topFiveScores               = "TOP_FIVE_SCORES"
      static let twoPlayers                  = "TWO_PLAYERS"
      static let words                       = "WORDS"
      static let wordsLanguage               = "WORDS_LANGUAGE"
   }

   enum NonLocalisedString {
      static let appName                     = "Guessable - Hangman"
      static let gitHub                      = "GitHub"
      static let linkedIn                    = "LinkedIn"
   }

   enum WordsLanguage {
      static let croatian           = Language(location: "hr", localised: LocalisedString.croatian)
      static let english            = Language(location: "en", localised: LocalisedString.english)
   }
}
