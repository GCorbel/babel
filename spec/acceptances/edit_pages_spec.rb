require 'spec_helper'

feature "Edit a translation" do
  scenario "A user edit a scenario", js: true do
    visit '/'
    page.find('.editing-mode').click()
    find('textarea').set('Hello %{name}!')
    page.find('.save').click()
    expect(page).to have_content 'Hello %{name}!'
    sleep 1
    page.find('.persist').click()
    sleep 2
    I18n.reload!
    visit '/'
    expect(page).to have_content 'Hello Joe!'
  end
end
