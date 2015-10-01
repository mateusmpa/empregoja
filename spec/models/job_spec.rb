require 'rails_helper'
describe Job do

  it "Should be recent" do
    job = create(:job)

    #expect(job.recent?).to eq true
    expect(job).to be_recent

  end

  it "should not be recent" do
    job = Job.new
    travel_to 5.days.ago do
      job = create(:job)
    end
    #expect(job.recent?).to eq false
    expect(job).to_not be_recent
  end

  it "should not be expired" do
    job = Job.new

    travel_to 89.days.ago do
      job = create(:job)
    end
     expect(job).not_to be_expired
  end

  it "should be expired" do
    job = Job.new

    travel_to 91.days.ago do
      job = create(:job)
    end
    expect(job).to be_expired
  end

  it "should be featured" do
    job = create(:job)

    expect(job).to be_featured
  end

  it "should not be featured" do
    job = create(:job, featured: true)

    expect(job).to be_featured
  end

end
