class TeachersBackofficeController < ApplicationController
    before_action :authenticate_teacher! 
    layout "teachers_backoffice"
end
