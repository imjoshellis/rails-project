# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = [
  {name: "admin"},
  {name: "manager"},
  {name: "lead"},
  {name: "developer"},
  {name: "guest"}
]

Role.create(roles)

users = [
  {name: "Josh", email: "josh@imjoshellis.com", password: "joshjosh", role_id: 1},
  {name: "Chris", email: "chris@email.com", password: "chrischris", role_id: 2},
  {name: "Anna", email: "anna@email.com", password: "annaanna", role_id: 2},
  {name: "Rachel", email: "rachel@email.com", password: "rachelrachel", role_id: 3},
  {name: "Frank", email: "frank@email.com", password: "frankfrank", role_id: 4},
  {name: "Guest", email: "guest@email.com", password: "guestguest", role_id: 5}
]

User.create(users)

projects = [
  {name: "rails project", description: "Project management app"},
  {name: "sinatra project", description: "Board game collection app"}
]

Project.create(projects)

user_projects = [
  {user_id: 1, project_id: 1},
  {user_id: 1, project_id: 2},
  {user_id: 2, project_id: 2},
  {user_id: 3, project_id: 1},
  {user_id: 4, project_id: 1},
  {user_id: 4, project_id: 2},
  {user_id: 5, project_id: 1},
  {user_id: 6, project_id: 1},
  {user_id: 6, project_id: 2}
]

UserProject.create(user_projects)

sprints = [
  {project_id: 1, name: "Beta Release", start_date: Time.now, end_date: 3.weeks.from_now},
  {project_id: 2, name: "Sessions setup", start_date: Time.now, end_date: 3.weeks.from_now},
  {project_id: 2, name: "Users setup", start_date: 3.weeks.from_now, end_date: 6.weeks.from_now}
]

Sprint.create(sprints)

goals = [
  {project_id: 1, sprint_id: 2, name: "Users can login"},
  {project_id: 1, sprint_id: 3, name: "Admins can change user roles"},
  {project_id: 1, sprint_id: 3, name: "Managers can create new goals"},
  {project_id: 1, sprint_id: 3, name: "Developers can create and edit stories"},
  {project_id: 2, sprint_id: 1, name: "Users can login"},
  {project_id: 2, sprint_id: 1, name: "Users can add games to their collection"}
]

Goal.create(goals)

stories = [
  {goal_id: 1, sprint_id: 2, name: "I see a login screen", effort: 3, value: 9, status: "closed"},
  {goal_id: 2, sprint_id: 3, name: "I see a list of users and their roles", effort: 5, value: 7, status: "todo"},
  {goal_id: 3, sprint_id: 3, name: "I see a create goal form", effort: 4, value: 4, status: "doing"}
]

Story.create(stories)
