class ApplicationController < ActionController::Base
    helper_method :current_user, :current_course
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def current_course
        if params[:course_id]
            @current_course ||= Course.find(params[:course_id])
        elsif controller_name == "courses" && params[:id].present?
            @current_course ||= Course.find(params[:id])
        else
            @current_course = nil
        end
    end
end
