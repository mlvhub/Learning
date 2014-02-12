require "sinatra"

get '/hi' do
  "Hello World!"
end

post "/form_submitted" do
  "Form was submitted."
end
