require 'rails_helper'

RSpec.describe Employee, type: :feature do
  context 'create new Employee' do 
    before(:each) do
      visit new_employee_path
      fill_in 'Name', with: 'Andy'
      fill_in 'Age', with: '18'
      fill_in 'Tel', with: '0900333444'
      fill_in 'Email', with: '123@gmail.com'
      fill_in 'Intro', with: 'testing'
    end
    
    scenario 'valid inputs' do
      click_on 'send profile'
      visit employees_path
      expect(page).to have_content('Nice')
      expect(page).to have_content('0')
      expect(page).to have_content('Andy')
      expect(page).to have_content('18')
      expect(page).to have_content('0900333444')
      expect(page).to have_content('123@gmail.com')
      expect(page).to have_content('testing')
      expect(page).to have_content('Update Info')
      expect(page).to have_content('Fire Employee')
    end

     scenario 'invalid inputs' do
      fill_in 'Name', with: ''
      click_on 'send profile'
      expect(page).to have_content("Name can't be blank")
    end
  
    scenario 'invalid inputs' do
      fill_in 'Age', with: ''
      click_on 'send profile'
      expect(page).to have_content("Age can't be blank")
    end
  
    scenario 'invalid inputs' do
      fill_in 'Tel', with: ''
      click_on 'send profile'
      expect(page).to have_content("Tel can't be blank")
    end
  
    scenario 'invalid inputs' do
      fill_in 'Email', with: ''
      click_on 'send profile'
      expect(page).to have_content("Email can't be blank")
    end
  end

  context 'Employee Actions' do 
    before(:each) do
      visit new_employee_path
      fill_in 'Name', with: 'Andy'
      fill_in 'Age', with: '18'
      fill_in 'Tel', with: '0900333444'
      fill_in 'Email', with: '123@gmail.com'
      fill_in 'Intro', with: 'testing'
      click_on 'send profile'
      visit employees_path
    end

    scenario 'Goodjob count' do
      click_on 'Nice'
      expect(page).to have_content('1')
    end

    scenario 'Read Employee data' do
      click_on 'Andy'
      visit employee_path(1)
      expect(page).to have_content('Andy')
      expect(page).to have_content('18')
      expect(page).to have_content('0900333444')
      expect(page).to have_content('123@gmail.com')
      expect(page).to have_content('testing')
    end

    scenario 'valid Read data' do
      visit employee_path(1200)
      expect(page).to have_content('Record not found !')
    end

    scenario 'Back to Home Page after read Employee data' do
      click_on 'Andy'
      visit employee_path(1)
      click_link 'All Employees'
      visit employees_path
      expect(page).to have_content('All Employees')
      expect(page).to have_content('Andy')
    end

    scenario 'edit Employee data' do
      click_on 'Update Info'
      visit edit_employee_path(1)
      expect(page).to have_content('Update Employee')
    end

    scenario 'Update Employee data' do
      click_on 'Update Info'
      visit edit_employee_path(1)
      fill_in 'Name', with: 'Robert'
      click_on 'send profile'
      expect(page).to have_content('All Employees')
      expect(page).to have_content('Robert')
    end
  end
end

  # scenario 'Delete Employee data' do
  #   visit new_employee_path
  #   fill_in 'Name', with: 'Andy'
  #   fill_in 'Age', with: '18'
  #   fill_in 'Tel', with: '0900333444'
  #   fill_in 'Email', with: '123@gmail.com'
  #   fill_in 'Intro', with: 'testing'
  #   click_on 'send profile'
  #   visit employees_path
  #   click_on 'Fire Employee'
  #   visit employees_path
  #   expect(page).not_to have_content('Nice')
  #   expect(page).not_to have_content('0')
  #   expect(page).not_to have_content('Andy')
  #   expect(page).not_to have_content('18')
  #   expect(page).not_to have_content('0900333444')
  #   expect(page).not_to have_content('123@gmail.com')
  #   expect(page).not_to have_content('testing')
  #   expect(page).not_to have_content('Update Info')
  #   expect(page).not_to have_content('Fire Employee')
  # end