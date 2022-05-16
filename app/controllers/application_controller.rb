class ApplicationController < ActionController::Base
    include SessionsHelper
    # def hello
    #     render html: "This is my first app RoR to deploy in Heroku!"
    # end

    private

        # Confirms a logged-in user. 
        def logged_in_user
            unless logged_in?
                store_location
                flash.now[:danger] = "Please log in." 
                redirect_to login_url
            end 
        end

end
