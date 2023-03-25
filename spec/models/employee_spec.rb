require 'rails_helper'

RSpec.describe Employee, type: :model do
  it ('columns with data') do
    columns = Employee.column_names
    expect(columns).to include('id')
    expect(columns).to include('name')
    expect(columns).to include('age')
    expect(columns).to include('tel')
    expect(columns).to include('email')
    expect(columns).to include('intro')
    expect(columns).to include('goodjob')
    expect(columns).to include('good_job_logs_count')
  end

  # it ('validates name') do
  #   expect(Employee.new).not_to be_valid
  #   expect(Employee.new(name: 'nn', age: 18, tel: '0933555666', email: 'aa@com.tw')).to be_valid
  # end

  it ('validates name') do
    expect(Employee.new(age: 18, tel: '0933555666', email: 'aa@com.tw')).not_to be_valid
    expect(Employee.new(name: 'nn', age: 18, tel: '0933555666', email: 'aa@com.tw')).to be_valid
  end

  it ('validates age') do
    expect(Employee.new(name: 'nn', tel: '0933555666', email: 'aa@com.tw')).not_to be_valid
    expect(Employee.new(name: 'nn', age: 18, tel: '0933555666', email: 'aa@com.tw')).to be_valid
  end

  it ('validates tel') do
    expect(Employee.new(name: 'nn', age: 18, email: 'aa@com.tw')).not_to be_valid
    expect(Employee.new(name: 'nn', age: 18, tel: '0933555666', email: 'aa@com.tw')).to be_valid
  end

  it ('validates email') do
    expect(Employee.new(name: 'nn', age: 18, tel: '0933555666')).not_to be_valid
    expect(Employee.new(name: 'nn', age: 18, tel: '0933555666', email: 'aa@com.tw')).to be_valid
  end

  it ('with many good_job_logs') do
    employee = Employee.create(name: 'nn', age: 18, tel: '0933555666', email: 'aa@com.tw')
    good_job_log = GoodJobLog.create(employee_id: 1, ip_address: '5626539')
    expect(employee.good_job_logs).to include(good_job_log)
  end
end
