# Classes

## Projects

has_many :users
has_many :goals
has_many :sprints, through => :goals
has_many :issues, through => :sprints

title:string
description:string

## Sprints

has_many :goals
has_many :issues
belongs_to :projects
has_many :users, through => :projects

title:string
start_date:datetime
end_date:datetime

## Goals

belongs_to :project
belongs_to :sprint

project_id:integer
sprint_id:integer
title:string
description:string

## Stories

belongs_to :sprint
belongs_to :project, through => :sprint

title:string
description:string
effort:integer {1...10}
value:integer {1...10}
sprint_id:integer

## Teams

belongs_to :user

## Users
