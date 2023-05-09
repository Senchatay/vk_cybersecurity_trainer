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

Category.create!([
                   { id: 1,
                     name: 'Easy',
                     description: 'Простые задачи' },
                   { id: 2,
                     name: 'Medium',
                     description: 'Задачи среднего уровня' },
                   { id: 3,
                     name: 'Hard',
                     description: 'Сложные задачи' }
                 ])
puts 'Categories was created!'

Task.create!([
               { id: 1,
                 name: '[EASY] CrackMe',
                 description: "CrackMe made specifically for beginners.\n" \
                             '- Crack the username and the password to have access to the program.',
                 category_id: 1 },
               { id: 2,
                 name: 'Salt and Hash - Windows',
                 description: 'Crack the hash!',
                 category_id: 2 },
               { id: 3,
                 name: '[Hard] CrackMe',
                 description: 'Усложненная задача CrackMe',
                 category_id: 3 },
               { id: 4,
                 name: '[Easy] CrackMe++',
                 description: 'Обновленная версия CrackMe',
                 category_id: 1 }
             ])
puts 'Tasks was created!'

User.create!([
               { id: 1, name: 'Арсений' },
               { id: 2, name: 'Егор' }
             ])
puts 'Users was created!'

Solution.create!([
                   {
                     id: 1,
                     content:
                        "func twoSum(nums []int, target int) []int {\n    " \
                        "hash := make(map[int]int, len(nums))\n    for index, value := range nums {\n        " \
                        "pair_index, present := hash[target-value]\n        if present {\n            " \
                        "return []int{index, pair_index};\n        } \n        " \
                        "\n        hash[value] = index\n    }\n    return []int{};\n}",
                     user_id: 1,
                     task_id: 1
                   },
                   {
                     id: 2,
                     content:
                         "func convert(s string, numRows int) string {\n    if numRows == 1 {\n        " \
                         "return s\n    }\n    res := make([]string, numRows)\n    i := 0\n    " \
                         "zigzag_len := (2*numRows - 2)\n    var current int\n\n    for n, sym := range s {\n        " \
                         "res[i] += string(sym)\n        current = (n + 1) % zigzag_len\n        " \
                         "if current >= numRows || current == 0  {\n            i--\n        } else {\n            " \
                         "i++    \n        }\n    }\n    return strings.Join(res,\"\")\n}",
                     user_id: 1,
                     task_id: 1
                   },
                   {
                     id: 3,
                     content:
                         "func convert(s string, numRows int) string {\n    if numRows == 1 {\n        " \
                         "return s\n    }\n    res := make([]string, numRows)\n    i := 0\n    " \
                         "zigzag_len := (2*numRows - 2)\n    var current int\n\n    for n, sym := range s {\n        " \
                         "res[i] += string(sym)\n        current = (n + 1) % zigzag_len\n        " \
                         "if current >= numRows || current == 0  {\n            i--\n        " \
                         "} else {\n            i++    \n        }\n    }\n    return strings.Join(res,\"\")\n}",
                     user_id: 1,
                     task_id: 1
                   },
                   {
                     id: 4,
                     content:
                         "func convert(s string, numRows int) string {\n    if numRows == 1 {\n        " \
                         "return s\n    }\n    res := make([]string, numRows)\n    i := 0\n    " \
                         "zigzag_len := (2*numRows - 2)\n    var current int\n\n    for n, sym := range s {\n        " \
                         "res[i] += string(sym)\n        current = (n + 1) % zigzag_len\n        " \
                         "if current >= numRows || current == 0  {\n            i--\n        " \
                         "} else {\n            i++    \n        }\n    }\n    return strings.Join(res,\"\")\n}",
                     user_id: 1,
                     task_id: 3
                   },
                   {
                     id: 5,
                     content: 'User.select(:name).distinct.distinct(false)',
                     user_id: 2,
                     task_id: 1
                   },
                   {
                     id: 6,
                     content:
                         "SELECT customerName, customercity, customermail, salestotal\nFROM onlinecustomers AS oc\n   " \
                         "INNER JOIN\n   orders AS o\n   ON oc.customerid = o.customerid\n   INNER JOIN\n   " \
                         "sales AS s\n   ON o.orderId = s.orderId",
                     user_id: 2,
                     task_id: 4
                   }
                 ])
puts 'Solutions was created!'
