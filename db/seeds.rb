# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Solution.destroy_all
User.destroy_all
Task.destroy_all
Category.destroy_all

categorys = {
  easy: Category.new(name: 'Easy', description: 'Простые задачи'),
  medium: Category.new(name: 'Medium', description: 'Задачи среднего уровня'),
  hard: Category.new(name: 'Hard', description: 'Сложные задачи')
}
categorys.each_value(&:save!)
puts 'Categories was created!'

tasks = [
  Task.new(
    name: '[EASY] CrackMe',
    description: "CrackMe made specifically for beginners.\n" \
                '- Crack the username and the password to have access to the program.',
    category_id: categorys[:easy].id
  ), Task.new(
    name: 'Salt and Hash - Windows',
    description: 'Crack the hash!',
    category_id: categorys[:medium].id
  ), Task.new(
    name: '[Hard] CrackMe',
    description: 'Усложненная задача CrackMe',
    category_id: categorys[:hard].id
  ), Task.new(
    name: '[Easy] CrackMe++',
    description: 'Обновленная версия CrackMe',
    category_id: categorys[:easy].id
  )
]
tasks.each(&:save!)
task_ids = tasks.map(&:id)
puts 'Tasks was created!'

users = [
  User.new(name: 'Арсений', email: 'landih73@gmail.com', password: '123456'),
  User.new(name: 'Егор', email: 'egor@gmail.com', password: '123456')
]
users.each(&:save!)
puts 'Users was created!'

Solution.create!([
                   {

                     content:
                        "func twoSum(nums []int, target int) []int {\n    " \
                        "hash := make(map[int]int, len(nums))\n    for index, value := range nums {\n        " \
                        "pair_index, present := hash[target-value]\n        if present {\n            " \
                        "return []int{index, pair_index};\n        } \n        " \
                        "\n        hash[value] = index\n    }\n    return []int{};\n}",
                     user_id: users[0].id,
                     task_id: task_ids[0]
                   },
                   {

                     content:
                         "func convert(s string, numRows int) string {\n    if numRows == 1 {\n        " \
                         "return s\n    }\n    res := make([]string, numRows)\n    i := 0\n    " \
                         "zigzag_len := (2*numRows - 2)\n    var current int\n\n    for n, sym := range s {\n        " \
                         "res[i] += string(sym)\n        current = (n + 1) % zigzag_len\n        " \
                         "if current >= numRows || current == 0  {\n            i--\n        } else {\n            " \
                         "i++    \n        }\n    }\n    return strings.Join(res,\"\")\n}",
                     user_id: users[0].id,
                     task_id: task_ids[0]
                   },
                   {

                     content:
                         "func convert(s string, numRows int) string {\n    if numRows == 1 {\n        " \
                         "return s\n    }\n    res := make([]string, numRows)\n    i := 0\n    " \
                         "zigzag_len := (2*numRows - 2)\n    var current int\n\n    for n, sym := range s {\n        " \
                         "res[i] += string(sym)\n        current = (n + 1) % zigzag_len\n        " \
                         "if current >= numRows || current == 0  {\n            i--\n        " \
                         "} else {\n            i++    \n        }\n    }\n    return strings.Join(res,\"\")\n}",
                     user_id: users[0].id,
                     task_id: task_ids[0]
                   },
                   {

                     content:
                         "func convert(s string, numRows int) string {\n    if numRows == 1 {\n        " \
                         "return s\n    }\n    res := make([]string, numRows)\n    i := 0\n    " \
                         "zigzag_len := (2*numRows - 2)\n    var current int\n\n    for n, sym := range s {\n        " \
                         "res[i] += string(sym)\n        current = (n + 1) % zigzag_len\n        " \
                         "if current >= numRows || current == 0  {\n            i--\n        " \
                         "} else {\n            i++    \n        }\n    }\n    return strings.Join(res,\"\")\n}",
                     user_id: users[0].id,
                     task_id: task_ids[2]
                   },
                   {

                     content: 'User.select(:name).distinct.distinct(false)',
                     user_id: users[1].id,
                     task_id: task_ids[0]
                   },
                   {

                     content:
                         "SELECT customerName, customercity, customermail, salestotal\nFROM onlinecustomers AS oc\n   " \
                         "INNER JOIN\n   orders AS o\n   ON oc.customerid = o.customerid\n   INNER JOIN\n   " \
                         "sales AS s\n   ON o.orderId = s.orderId",
                     user_id: users[1].id,
                     task_id: task_ids[3]
                   }
                 ])
puts 'Solutions was created!'
