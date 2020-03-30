# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: 'Oleg')

category1 = Category.create(title: 'Ruby')
category2 = Category.create(title: 'Ruby on Rails')
category3 = Category.create(title: 'Java')

test1 = Test.create(title: 'Ruby Basic level', level: 1, category_id: category1.id, user_id: user.id)
test2 = Test.create(title: 'Ruby Middle', level: 3, category_id: category1.id, user_id: user.id)
test3 = Test.create(title: 'Ruby Hard level', level: 9, category_id: category1.id, user_id: user.id)

question = Question.create(body: 'What kinds of variables exist in Ruby?', test_id: test1.id)

answer1 = Answer.create(body: 'Correct answer', question_id: question.id, correct: true)
answer2 = Answer.create(body: 'Incorrect answer1', question_id: question.id)
answer3 = Answer.create(body: 'Incorrect answer1', question_id: question.id)
answer4 = Answer.create(body: 'Incorrect answer1', question_id: question.id)
