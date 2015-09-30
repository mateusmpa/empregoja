require 'rails_helper'

feature 'User update a company' do

  scenario 'successfully' do
    company = Company.create!(name:"Campus Code", location: "São Paulo", phone: "(11) 455667788", mail: "campus@campus.com")

    visit edit_company_path(company)

    fill_in "Name", with: "Qualquer Coisa"
    click_on "Atualizar Empresa"

    expect(page).to have_content "Qualquer Coisa"

  end

  scenario 'unsuccesfully' do
    company = Company.create!(name:"Campus Code", location: "São Paulo", phone: "(11) 455667788", mail: "campus@campus.com")

    visit edit_company_path(company)

    fill_in "Name", with: ""
    click_on "Atualizar Empresa"

    expect(page).to have_content "Warning! All fields are mandatory."

  end
end
