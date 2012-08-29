require 'spec_helper'

describe "Micropost Pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do
      it "should not create a micropost" do
        expect { click_button "Post" }.to_not change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in 'micropost_content', with: "Lorem ipsum"
      end

      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    let!(:micropost) { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a micropost" do
        expect { click_link "Delete" }.to change(Micropost, :count).by(-1)
      end
    end

    describe "as incorrect user" do
      before do
        let(:incorrect_user) { FactoryGirl.create(:user) }
        sign_in user
        visit root_path

        describe "should not show delete links" do
          it { should_not have_link("Delete", href: delete_micropost_path) }
        end
      end
    end
  end
end
