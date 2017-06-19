require "rails_helper"
require 'support/factory_girl'
require 'factory_girl'


RSpec.describe EventsController, :type => :controller do


# new action

 describe "GET#new" do
         
          before(:each) do
           @user = FactoryGirl.create(:user)
         end

         before(:each) do
           session[:user_id] = @user.id
           session[:role] = @user.role
        end
    
      it "should get a new form" do
        get :new
        expect(assigns(:event)).to be_a_new(Event)
      end
      
      it "it should render the new template" do
        get :new, {user_id: @user.id}
        expect(subject).to render_template("events/new")
        end

    end


# create action

    describe "GET#create" do

      before(:each) do
           @user = FactoryGirl.create(:user)
         end

     before(:each) do
         session[:user_id] = @user.id
         session[:role] = @user.role
        end

      it "should save the record" do

        post :create ,:event => FactoryGirl.attributes_for(:event)#using factory girl
        expect(assigns(:event)).not_to be_a_new(Event)

      end

      it "should redirected to particular template" do

        post :create ,:event => FactoryGirl.attributes_for(:event) #using factory girl
        expect(flash[:notice]).to match(/New user succefully created/i)
        expect(response).to redirect_to root_path
      end

   end

# edit action

  describe "GET#edit" do
      before :each do
              @event = create(:event)
      end

      before(:each) do
           @user = FactoryGirl.create(:user)
         end

      before(:each) do
          session[:user_id] = @user.id
          session[:role] = @user.role
      end

      it "should assign instance variable it hold one record" do

        get :edit ,id: @event
        expect(assigns(:event)).to eq(@event)
      end
      it "should render the template" do

       get :edit ,id: @event
        expect(response).to render_template("edit")
      end

    end

# update action

describe "PATCH#update" do
     before :each do
              @event = create(:event)
      end

      before(:each) do
           @user = FactoryGirl.create(:user)
         end

      before(:each) do
          session[:user_id] = @user.id
          session[:role] = @user.role
      end

    it "should assign a instanse variable" do

        patch :update ,id: @event ,:event => FactoryGirl.attributes_for(:event)
        expect(assigns(:event)).to eq(@event)
    end

     it "should update a instanse variable attributes" do

        patch :update ,id: @event ,:event => FactoryGirl.attributes_for(:event,name: "arun")
        @event.reload
        expect(assigns(:event).name).to eq("arun")
     end
  end

# show action

describe "GET#show" do
      before :each do
              @event = create(:event)
      end

      before(:each) do
           @user = FactoryGirl.create(:user)
         end

      before(:each) do
          session[:user_id] = @user.id
       end

      it "should assign instance variable it hold one record" do

        get :show ,id: @event
        expect(assigns(:event)).to eq(@event)
      end
      it "should render the template" do

       get :show ,id: @event
        expect(response).to render_template("show")
        expect(assigns(session[:event_id])).to eq(@event.id) if session[:role] == "ADMIN"
      end

    end

# index action


describe "GET#index" do
      before(:each) do
           @user = FactoryGirl.create(:user)
         end

      before(:each) do
          session[:user_id] = @user.id
       end

      it "should assign instance variable it hold one record" do
        event=Event.create(name: 'bala',venue: 'bommanahalli',country: 'India',city: 'tamilnadu',start_date: "2017-12-19 00:00:0",end_date: "2020-12-20 00:00:00")
        get :index 
        expect(assigns(:events)).to eq([event])
        expect(assigns(:events)).to eq([event]) unless session[:role] == "ADMIN"

      end

    end

  end
