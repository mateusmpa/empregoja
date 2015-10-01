require 'rails_helper'

feature 'User visit recent jobs' do

  scenario 'successfully' do
    company_google = create(:company, name: "Google")
    category_analista = create(:category, name: "Analista")

    create(:job)
    create(:job, title: "Programador")

    travel_to 1.years.ago do

      create(:job, company: company_google)
      create(:job, category: category_analista)
    end

    visit jobs_path

    expect(page).to have_content "Novidade", count: 2
  end

end
