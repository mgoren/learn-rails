require 'rails_helper'

describe 'the add lesson process' do

  it 'adds a new lesson' do
    visit lessons_path
    click_on 'Add Lesson'
    fill_in 'Name', with: 'Capybara party'
    fill_in 'Content', with: 'All night'
    click_on 'Create Lesson'
    expect(page).to have_content 'All night'
  end

  it 'gives error when no name is entered' do
    visit lessons_path
    click_on 'Add Lesson'
    fill_in 'Content', with: 'foo'
    click_on 'Create Lesson'
    expect(page).to have_content 'errors'
  end


end
