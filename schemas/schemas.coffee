mongoose = require 'mongoose'
Schema = mongoose.Schema

EssayGrades = new Schema(
  Grader: String
  Author: String
  Grades: Array
  EssayTexts: Array
)

EssayGrades = mongoose.model 'EssayGrades', EssayGrades

module.exports =
  EssayGrades : EssayGrades