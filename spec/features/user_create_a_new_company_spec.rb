require 'rails_helper'

feature 'User create a new company' do
  scenario 'successfully' do
    visit new_company_path

    fill_in "Name", with: "Campus Code"
    fill_in "Location", with: "São Paulo"
    fill_in "Phone", with: "(11) 3544-0500"
    fill_in "Mail", with: "campus@campuscode.com"
    click_on "Criar Empresa"

    expect(page).to have_content "Campus Code"
    expect(page).to have_content "São Paulo"
    expect(page).to have_content "(11) 3544-0500"
    expect(page).to have_content "campus@campuscode.com"
  end

  scenario 'unsuccessfully' do
    visit new_company_path

    click_on "Criar Empresa"

    expect(page).to have_content "Warning! All fields are mandatory."
  end
end
