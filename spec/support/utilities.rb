
include ApplicationHelper

def full_title(page_title)
  base_title = 'Ruby on Rails Tutorial Sample App'
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user)
  visit signin_path
  valid_signin(user)
end

def valid_signin(user)
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_any_error_message do
  match do |page|
    page.should have_selector('div.alert.alert-error')
  end
end

RSpec::Matchers.define :have_title do |title|
  match do |page|
    page.should have_selector('title', text: title)
  end
end
