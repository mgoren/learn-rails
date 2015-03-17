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

describe 'the edit lesson process' do

  it 'edits a lesson' do
    lesson = Lesson.create(:name => "foo", :content => "bar")
    visit lesson_path(lesson)
    click_on 'foo'
    fill_in 'Content', :with => "blah"
    click_on 'Update Lesson'
    expect(page).to have_content 'Good job'
  end

  it 'gives an error when no content is updated' do
    lesson = Lesson.create(name: 'cat', content: 'blarf')
    visit lesson_path(lesson)
    click_on 'cat'
    fill_in 'Content', with: 'smurf'
    click_on 'Update Lesson'
    expect(page).to have_content 'Good job'
  end


end
