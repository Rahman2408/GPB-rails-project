class SessionsController < ApplicationController

    def logout
        session.clear 
        redirect_to root_path
    end

    
end
