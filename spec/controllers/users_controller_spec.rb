require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "if params are invalid" do
      it "it checks for flash error messages" do
        post :create, params: { user: { username: "Kimberly", password:"12345" }}
        expect(flash[:errors]).to be_present
      end
    end

    context "if params are indeed...valid?" do
      it "redirects our beloved user to his goal Index page" do
        post :create, params: { user: { username: "Kimberly", password:"12345and6" }}
        expect(response).to redirect_to(goals_url)
      end
    end
  end
end
