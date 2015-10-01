require 'rails_helper'

feature 'User update a company' do
  scenario 'successfully' do
    company = create(:company)

    visit edit_company_path(company)

    fill_in 'Name', with: 'Qualquer Coisa'
    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Qualquer Coisa'
  end

  scenario 'unsuccesfully' do
    company = create(:company)

    visit edit_company_path(company)

    fill_in 'Name', with: ''
    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end
end
