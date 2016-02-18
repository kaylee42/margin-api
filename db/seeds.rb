20.times {User.create(name: Faker::Name.name)}
50.times {Notebook.create(title: Faker::Hacker.adjective, description: Faker::Hacker.say_something_smart)}
15.times {Tag.create(title: Faker::Hacker.noun)}
15.times {Tag.create(title: Faker::Hacker.abbreviation)}
150.times {Sheet.create(title: Faker::Date.backward(30), content: Faker::Hipster.paragraph(2, true, 4))}

sheets = Sheet.all.map{|sheet| sheet.id}
notebooks = Notebook.all.map{|nb| nb.id}
tags = Tag.all.map{|tag| tag.id}
users = User.all.map{|u| u.id}

Sheet.all.each do |sheet|
  NotebookSheet.create(sheet_id: sheet.id, notebook_id: notebooks.sample)
end

Notebook.all.each do |nb|
  NotebookUser.create(notebook_id: nb.id, user_id: users.sample)
end

300.times {SheetTag.create(sheet_id: sheets.sample, tag_id: tags.sample)}

30.times {TodoList.create(title: Faker::App.name, user_id: users.sample)}

lists = TodoList.all.map{|l| l.id}

70.times {Todo.create(title: Faker::Hacker.ingverb, description: Faker::Hacker.say_something_smart, aasm_state: "open", due_date: Faker::Date.forward(42), todo_list_id: lists.sample, sheet_id: sheets.sample)}
