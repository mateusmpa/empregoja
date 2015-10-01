require 'rails_helper'

feature 'User visits featured jobs' do
  scenario 'successfully' do
    create(:company)
    create(:category)

    job = create(:job)

    visit job_path(job)

    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'California'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Programador'
    expect(page).to have_content 'Vaga para desenvolvedor'
    expect(page).to have_content 'Vaga em Destaque'
  end
end
