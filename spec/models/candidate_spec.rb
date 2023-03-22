require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it 'is accessible' do
    candidate = Candidate.create(name: 'name', party: 'party', age: '15', politics: 'pol')
    expect(candidate).to eq(Candidate.last) 
  end

  it 'has name  party age politics ' do
    columns = Candidate.column_names
    expect(columns).to include("name")
    expect(columns).to include("party")
    expect(columns).to include("age")
    expect(columns).to include("politics")
    expect(columns).to include("vote_logs_count")
  end

  it 'validate name' do
    expect(Candidate.new).not_to be_valid
    expect(Candidate.new(name: 'name')).to be_valid
  end

  it 'has_many vote_logs' do
    candidate = Candidate.create(name: 'nn', party: 'kkp', age: '22', politics: 'jbefb')
    vote_log = VoteLog.create(candidate_id: 1, ip_address: '2112312')
    expect(candidate.vote_logs).to include(vote_log)
  end
end
