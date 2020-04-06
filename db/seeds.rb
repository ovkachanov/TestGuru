# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


category1 = Category.create(title: 'Backend')
# category2 = Category.create(title: 'HTML')
# category3 = Category.create(title: 'Frontend')


test1 = Test.create(title: 'Backend', level: 1, category_id: category1.id, user_id: User.last.id)
# test2 = Test.create(title: 'HTML', level: 1, category_id: category2.id, user_id: User.last.id)
# test3 = Test.create(title: 'Frontend', level: 2, category_id: category3.id, user_id: User.last.id)

# question1 = Question.create(body: 'С помощью какого тега нужно задавать подписи к полям формы?', test_id: test1.id)
#
# answer1 = Answer.create(body: 'field', question_id: question1.id)
# answer2 = Answer.create(body: 'type', question_id: question1.id)
# answer3 = Answer.create(body: 'id', question_id: question1.id)
# answer4 = Answer.create(body: 'label', question_id: question1.id, correct: true)
#
# question2 = Question.create(body: 'С помощью какого атрибута объединяются ячейки таблицы по горизонтали?', test_id: test1.id)
#
# answer1 = Answer.create(body: 'colspan', question_id: question2.id, correct: true)
# answer2 = Answer.create(body: 'rowspan', question_id: question2.id)
# answer3 = Answer.create(body: 'unity', question_id: question2.id)
# answer4 = Answer.create(body: 'union', question_id: question2.id)
#
# question3 = Question.create(body: 'Какую кодировку следует использовать на сайте?', test_id: test1.id)
#
# answer1 = Answer.create(body: 'UTF-8', question_id: question3.id, correct: true)
# answer2 = Answer.create(body: 'UTF-16', question_id: question3.id)
# answer3 = Answer.create(body: 'UTF-32', question_id: question3.id)
# answer4 = Answer.create(body: 'WINSOWS-1251', question_id: question3.id)
#
# question4 = Question.create(body: 'Каким тегом задаются ячейки-заголовки в таблицах?', test_id: test1.id)
#
# answer1 = Answer.create(body: 'tr', question_id: question4.id)
# answer2 = Answer.create(body: 'td', question_id: question4.id)
# answer3 = Answer.create(body: 'head', question_id: question4.id)
# answer4 = Answer.create(body: 'th', question_id: question4.id, correct: true)
#
# question5 = Question.create(body: 'Каким тегом задаются ячейки-заголовки в таблицах?', test_id: test1.id)
#
# answer1 = Answer.create(body: '<strong>жирный</strong>', question_id: question5.id, correct: true)
# answer2 = Answer.create(body: '<a>жирный</a>', question_id: question5.id)
# answer3 = Answer.create(body: '<br>жирный</br>', question_id: question5.id)
# answer4 = Answer.create(body: '<p>жирный</p>', question_id: question5.id)
