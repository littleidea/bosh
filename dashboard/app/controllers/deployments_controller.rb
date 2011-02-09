class DeploymentsController < ApplicationController
  before_filter :director_credentials_required

  def index
    @deployments = Deployment.all(director)
    respond_to do |format|
      format.json do
        render :json => { :html => render_to_string(:partial => "deployments/list") }
      end
    end
  rescue Director::DirectorError => e
    respond_to do |format|
      format.json do
        render :json => { :error => e.message }
      end
    end
  end  
  
end