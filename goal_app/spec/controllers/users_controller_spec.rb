require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  jack = FactoryBot.create(:user)

  describe "GET #index" do
    it "renders users page" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    it "render user's information" do
      get :show, params: { id: jack.id }
      expect(response).to render_template('show')
    end
  end

  describe "GET #new" do
    it "should render new" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #edit" do
    it "should render edit" do
      get :edit, params: { id: jack.id }
      expect(response).to render_template('edit')
    end
  end

  describe "PATCH #update" do
    it "should redirect to User#show when success" do
      patch :update, params: { user: { username: 'jack', password: 'password' } }
      expect(response).to redirect_to(user_url(user.id))
    end

    it "should redirect to user's show page when failing" do
      post :create, params: { user: { username: 'jack', password: 'short' } }
      expect(response).to redirect_to(user_url(user.id))
      expect(flash[:errors]).to be_present
    end

  end

  describe "DELETE #destroy" do
    it "should redirect to User#create" do
      delete :destroy, params: { id: jack.id }
      expect(response).to redirect_to(new_user_url)
    end
  end

  describe "POST #create" do
    it "should redirect to User#show when creating user successfully" do
      post :create, params: { user: { username: 'jack', password: 'password' } }
      expect(response).to redirect_to(user_url(current_user))
    end

    it "should render User#new when failing" do
      post :create, params: { user: { username: 'jack', password: 'short' } }
      expect(response).to render_template('new')
      expect(flash[:errors]).to be_present
    end
  end

end
