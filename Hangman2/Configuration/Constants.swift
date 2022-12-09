//
//  Constants.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 03.11.2022..
//

import Foundation
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
      static let bluewood           = Color("bluewood")           // Color(red: 036/255, green: 056/255, blue: 065/255)
      static let carmine            = Color("carmine")            // Color(red: 168/255, green: 059/255, blue: 060/255)
      static let carnation          = Color("carnation")          // Color(red: 240/255, green: 072/255, blue: 086/255)
      static let dugong             = Color("dugong")             // Color(red: 112/255, green: 112/255, blue: 112/255)
      static let ebonyClay          = Color("ebonyClay")          // Color(red: 034/255, green: 042/255, blue: 049/255)
      static let galeForce          = Color("galeForce")          // Color(red: 255/255, green: 255/255, blue: 255/255)
      static let juanSan            = Color("juanSan")
      static let limedSpruce        = Color("limedSpruce")        // Color(red: 062/255, green: 081/255, blue: 089/255)
      static let mintLeaf           = Color("mintLeaf")           // Color(red: 000/255, green: 209/255, blue: 175/255)
      static let sanJuan            = Color("sanJuan")            // Color(red: 069/255, green: 088/255, blue: 096/255)
      static let seaDeep            = Color("seaDeep")            // Color(red: 043/255, green: 062/255, blue: 071/255)
      static let watermelon         = Color("watermelon")         // Color(red: 255/255, green: 115/255, blue: 123/255)
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

   enum GameDifficulty {
      static let easy            = Difficulty(level: "easy", localised: LocalisedString.easy)
      static let medium          = Difficulty(level: "medium", localised: LocalisedString.medium)
      static let hard            = Difficulty(level: "hard", localised: LocalisedString.hard)
   }

   enum Images {
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
      static let linkedIn                    = "linkedin"
      static let lightbulbFill               = "lightbulb.fill"
      static let lightbulbSlashFill          = "lightbulb.slash.fill"
      static let logoAppName                 = "logo_app_name"
      static let logoAppMock                 = "logo_app_mock"
      static let mePortrait                  = "me_portrait"
      static let moonFill                    = "moon.fill"
      static let score                       = "score"
      static let settings                    = "settings"
      static let sunMaxFill                  = "sun.max.fill"
      static let timer                       = "timer"
   }

   // swiftlint:disable: identifier_name
   enum LocalisedString {
      static let about                       = "ABOUT"
      static let application                 = "APPLICATION"
      static let chooseDifficulty            = "CHOOSE_DIFFICULTY"
      static let chooseWordsLanguage         = "CHOOSE_WORDS_LANGUAGE"
      static let combineDifficultyLevels     = "COMBINE_DIFFICULTY_LEVELS";      #warning("ne koristim")
      static let contactMe                   = "CONTACT_ME"
      static let contactReportInfo           = "CONTACT_REPORT_INFO"
      static let croatian                    = "CROATIAN"
      static let darkMode                    = "DARK_MODE"
      static let date                        = "DATE"
      static let dashDateOfPlaying           = "DASH_DATE_OF_PLAYING"
      static let dashDifficultyLevel         = "DASH_DIFFICULTY_LEVEL"
      static let dashTotalPlayingTime        = "DASH_TOTAL_PLAYING_TIME"
      static let dashTotalScore              = "DASH_TOTAL_SCORE"
      static let dashWinLoseRatio            = "DASH_WIN_LOSE_RATIO"
      static let difficulty                  = "DIFFICULTY"
      static let difficultyExample           = "DIFFICULTY_EXAMPLE";             #warning("ne koristim")
      static let difficultyLevels            = "DIFFICULTY_LEVELS"
      static let difficultyEasy              = "DIFFICULTY_EASY"
      static let difficultyMedium            = "DIFFICULTY_MEDIUM"
      static let difficultyHard              = "DIFFICULTY_HARD"
      static let easy                        = "EASY"
      static let easyDifficultyLength        = "EASY_DIFFICULTY_LENGTH"
      static let english                     = "ENGLISH"
      static let featureRequest              = "FEATURE_REQUEST"
      static let gameLost                    = "GAME_LOST"
      static let gameWin                     = "GAME_WIN"
      static let hard                        = "HARD"
      static let hardDifficultyLength        = "HARD_DIFFICULTY_LENGTH"
      static let highScores                  = "HIGH_SCORES"
      static let highestScore                = "HIGHEST_SCORE"
      static let hits                        = "HITS"
      static let info                        = "INFO"
      static let language                    = "LANGUAGE"
      static let listOfAllWords              = "LIST_OF_ALL_WORDS"
      static let listOfAllWordsInfo          = "LIST_OF_ALL_WORDS_INFO"
      static let longestGame                 = "LONGEST_GAME"
      static let losses                      = "LOSSES"
      static let medium                      = "MEDIUM"
      static let mediumDifficultyLength      = "MEDIUM_DIFFICULTY_LENGTH"
      static let misc                        = "MISC"
      static let ok                          = "OK"
      static let options                     = "OPTIONS"
      static let overview                    = "OVERVIEW"
      static let perfectWins                 = "PERFECT_WINS"
      static let play                        = "PLAY"
      static let played                      = "PLAYED"
      static let ratio                       = "RATIO"
      static let reportBug                   = "REPORT_BUG"
      static let rightLetter                 = "RIGHT_LETTER"
      static let score                       = "SCORE"
      static let scoringSystem               = "SCORING_SYSTEM"
      static let select                      = "SELECT"
      static let selectGameDifficultyLvl     = "SELECT_GAME_DIFFICULTY_LVL"
      static let settings                    = "SETTINGS"
      static let showHint                    = "SHOW_HINT"
      static let statistics                  = "STATISTICS"
      static let time                        = "TIME"
      static let topFiveScores               = "TOP_FIVE_SCORES"
      static let totalTime                   = "TOTAL_TIME"
      static let twoPlayers                  = "TWO_PLAYERS"
      static let winRate                     = "WIN_RATE"
      static let winRateInfo                 = "WIN_RATE_INFO"
      static let wins                        = "WINS"
      static let wordLengthPerLevel          = "WORD_LENGTH_PER_LEVEL"
      static let words                       = "WORDS"
      static let wordsLanguage               = "WORDS_LANGUAGE"
      static let wrongGuesses                = "WRONG_GUESSES"
      static let wrongLetter                 = "WRONG_LETTER"
      static let yourTopHighScores           = "YOUR_TOP_HIGH_SCORES"
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
