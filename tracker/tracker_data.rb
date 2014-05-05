require 'faraday'
require 'json'
require 'dotenv'

project_response = Faraday.new.get do |req|
  req.url 'https://www.pivotaltracker.com/services/v5/projects'
  req.headers['X-TrackerToken'] = ENV['TOKEN']
end

project_response_body = project_response.body

JSON.parse(project_response_body).select do |project|
  project["name"]
end

stories = Faraday.new.get do |request|
  request.url 'https://www.pivotaltracker.com/services/v5/projects/1029360/stories'
  request.headers['X-TrackerToken'] = ENV['TOKEN']
end

JSON.parse(stories.body).select do |story|
  story["name"]
  story["description"]
end



