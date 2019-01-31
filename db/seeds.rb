# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(name:  "Ethan",
              email: "xma21@ncsu.edu",
              password:              "rubyiscool",
              password_confirmation: "rubyiscool")
JobSeeker.create!(name: "flame",
                  email: "xma21@ncsu.edu",
                  full_name: "Xiao Ma",
                  password: "abc1234",
                  password_confirmation: "abc1234")
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@ratorial.org"
  password = "password"
  JobSeeker.create!(name: name,
               email: email,
               full_name: name,
               password: password,
               password_confirmation: password)
end

5.times do |n|
  name = Faker::Name.name
  website = "www.example-#{n+1}@railstutorial.org"
  Company.create!(name: name,
                  website:website,
                  headquarters: "Raleigh,NC",
                  size:"1000+",
                  founded: "10/10/1942",
                  industry:"Mechanical Engineering",
                  revenue:"$10,00000",
                  synopsis:"This is a great company!")
end

Recruiter.create!(name: "flame",
                  email: "xma21@ncsu.edu",
                  password: "abc1234",
                  password_confirmation: "abc1234")
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Recruiter.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
companies=Company.all
7.times do |n|
  description = "description#{n}"
  responsibility = "responsibility"
  requirement = "requirement"
  employment_type = "type"
  companies.each{|company| company.jobs.create!(description:  description, responsibility: responsibility, requirement: requirement, employment_type: employment_type,)}
end
=begin
jobs=Job.all
job_seekers=JobSeeker.all
relation=[]
20.times do |n|
  relation.push([jobs[n], job_seekers[n]])
end
20.times do |n|
  relation.each{|relation| relation.applications.create!(current_company:"fsdfsdfa",
                                                         linkedin_url:"sdfasdf",
                                                         portfolio_url:"sdfasdf",
                                                         additional_information:"asdfsadf",
                                                         gender:"asdfasdfsdaf",
                                                         race:"sdfasdfasdf",
                                                         veteran_status:"asdfasdf",
                                                         disability_status:"sadfdf",
                                                         status: "sadfas")}
end
=end

# 7.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+522}@railstutorial.org"
#   password = "password"
#   Application.create!(current_company:"fsdfsdfa",
#   linkedin_url:"sdfasdf",
#   portfolio_url:"sdfasdf",
#   additional_information:"asdfsadf",
#   gender:"asdfasdfsdaf",
#   race:"sdfasdfasdf",
#   veteran_status:"asdfasdf",
#   disability_status:"sadfdf",
#   status: "sadfas", job_id: n, job_seeker_id: n+1)
#   end
