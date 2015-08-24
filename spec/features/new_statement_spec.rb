require 'spec_helper'

feature 'statement' do
  before do
    seed_data
    login
    visit "/statement"
  end

  scenario 'new' do
    fill_in 'content', with: 'Is global warming real?'
    click_button "Next"
    expect(Statement.last.content).to eq("Is global warming real?")
  end

  scenario 'content can\'t be blank' do
    fill_in 'content', with: ""
    click_button "Next"
    expect(page).to have_text("Content can\'t be blank")
  end

  private

  def seed_data
    create(:statement)
    create(:individual, twitter: "arpahector")
  end

  def login
    visit "/auth/twitter"
  end
end