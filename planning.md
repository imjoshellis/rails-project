# Classes

## Projects

has_many :users, through => :user_projects
has_many :goals
has_many :sprints, through => :goals
has_many :stories, through => :sprints

name:string
description:string

## Sprints

has_many :goals
has_many :issues
belongs_to :projects, through => :goals
has_many :users, through => :projects

name:string
start_date:datetime
end_date:datetime

## Goals

belongs_to :project
belongs_to :sprint

project_id:integer
sprint_id:integer
name:string
description:string

## Stories

belongs_to :sprint
belongs_to :project, through => :sprint

name:string
description:string
effort:integer {1...10}
value:integer {1...10}
sprint_id:integer

## Roles

has_many :users

name:string

## UserProject

belongs_to :user
belongs_to :project

## Users

belongs_to :role
has_many :projects, through => :user_projects
has_secure_password

name:string
email:string
password_digest:string
role_id:integer
