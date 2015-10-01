require 'rails_helper'

feature 'User update job' do
  scenario 'successfully' do
    company = Company.create!(
      name: 'Campus Code',
      location: 'São Paulo',
      phone: '(11) 3544-0500',
      mail: 'campus@campus.com')
    category = Category.create!(name: 'Programador')
    job = Job.create!(
      title: 'Desenvolvedor',
      location: 'São Paulo',
      company: company,
      category: category,
      description: 'Esta é uma vaga para programador Ruby!')

    visit edit_job_path(job)

    fill_in 'Title', with: 'Banana'
    click_on 'Atualizar Vaga'

    expect(page).to have_content 'Banana'
  end
end
