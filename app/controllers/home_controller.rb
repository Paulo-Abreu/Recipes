class HomeController < ApplicationController
    def index
        @props = {
            component_name: 'home'
        }
    end
end