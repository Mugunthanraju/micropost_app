class ApplicationController < ActionController::Base
    def hello
        render html: "This is my first app RoR to deploy in Heroku!"
    end
end
