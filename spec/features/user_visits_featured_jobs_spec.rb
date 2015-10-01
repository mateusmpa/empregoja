require 'rails_helper'

feature 'User visits featured jobs' do

  scenario 'successfully' do

    #company = Company.create!(name: "Campus Code",location: "São Paulo",phone: "22334455",mail: "campuscode@campuscode.com")
    company = create(:company)
    #category = Category.create!(name:"Programador")
    category = create(:category)

    #job = Job.create!(title: "Desenvolvedor", location: "California", company: company, category: category, description: "Vaga para desenvolvedor", featured: true)
    job = create(:job)

    visit job_path(job)

    expect(page).to have_content "Desenvolvedor"
    expect(page).to have_content "California"
    expect(page).to have_content "Campus Code"
    expect(page).to have_content "Programador"
    expect(page).to have_content "Vaga para desenvolvedor"
    expect(page).to have_content "Vaga em Destaque"

  end

end
