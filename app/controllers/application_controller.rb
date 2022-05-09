class ApplicationController < ActionController::Base

    def hello
        render text: "This is my first RoR app to deploy, so hi everyone."
    end
end
