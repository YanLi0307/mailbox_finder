# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require Rails.root.join('spec', 'support', 'factories', 'mailbox_locations.rb')
require 'rubygems'           #so it can load gems
require 'factory_girl_rails' #so it can run in development

FactoryGirl.create(:mailbox)
FactoryGirl.create(:location)
