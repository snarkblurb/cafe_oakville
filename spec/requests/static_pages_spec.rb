require 'spec_helper'

describe "StaticPages" do
	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_selector('h1', text: 'Cafe Oakville') }
	end

	describe "Menu page" do
		before { visit menu_path }

		it { should have_title(full_title('Menu')) }
	end

	describe "Sign In page" do
		before { visit signin_path }

		it { should have_title(full_title('Sign In')) }
	end
end
