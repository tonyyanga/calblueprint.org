module Admins
  class StudentApplicationsController < BaseController
    def index
      @student_applications = StudentApplication.order(:id)
      respond_to do |format|
        format.html
        format.csv { send_data StudentAppsCsv.to_csv @student_applications }
      end
    end

    def show
      app = StudentApplication.find(params[:id])
      @app = StudentApplicationDecorator.new app
    end
  end
end
