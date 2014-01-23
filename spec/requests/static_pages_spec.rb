require 'spec_helper'

describe "Static Pages" do
	
	describe "Home page" do
		it "should have the content 'Sample App' "  do
			visit '/static_pages/home'
		    expect(page).to have_content('Sample App')			
		end
		it "should have the right title 'home page' "do
			visit '/static_pages/home'
			expect(page).to have_title('Home')
		end
	end

	describe "help page" do
		it "should have the content 'help' " do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end
		it "should have the right title 'help' to" do
			visit '/static_pages/help'
			expect(page).to have_title('Help')
		end
	end

	describe "about page" do
		it "should have the content'about' " do
			visit '/static_pages/about'
			expect(page).to have_content('About')
		end
		it "should have the right title 'about' to" do
			visit '/static_pages/about'
			expect(page).to have_title('About')
		end
	end
end
