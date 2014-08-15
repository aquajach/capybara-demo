require 'capybara/rspec'

#Alertnative to Selenium, poltergeist is an alternative javascript driver, more info: https://github.com/teampoltergeist/poltergeist
#require 'poltergeist'

describe 'Test local app', type: :feature  do
  before do
    Capybara.configure do |config|
      config.default_driver = :selenium
      #Remove below two lines if capybara is to test an internal application
      config.run_server = false
      config.app_host = 'http://www.kickerendurance.com/'

      #To add support for more browsers: https://github.com/jnicklas/capybara#configuring-and-adding-drivers
    end
  end

  it 'can log in' do
    visit '/'
    expect(page).to have_content 'Sign In'
    click_link 'Sign In'
    expect(page).to have_link 'Forgot your password?'
  end
end