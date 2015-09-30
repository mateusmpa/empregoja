require 'rails_helper'

feature 'User create a new job' do

  scenario 'successfully' do

    Company.create!(name: "Campus Code",location: "São Paulo",phone: "22334455",mail: "campuscode@campuscode.com")

    Category.create!(name:"Programador")

    visit new_job_path

    fill_in "Title", with: "Desenvolvedor"
    fill_in "Location", with: "São Paulo"
    select "Campus Code", from: "job[company_id]"
    select "Programador", from: "job[category_id]"
    fill_in "Description", with: "Esta é uma vaga para programador Ruby"
    click_on "Criar Vaga"

    expect(page).to have_content "Desenvolvedor"
    expect(page).to have_content "São Paulo"
    expect(page).to have_content "Campus Code"
    expect(page).to have_content "Programador"
    expect(page).to have_content "Esta é uma vaga para programador Ruby"
  end

  scenario 'unsuccesfully' do
    visit new_job_path

    click_on "Criar Vaga"

    expect(page).to have_content "Warning! All fields are mandatory."
  end
end
