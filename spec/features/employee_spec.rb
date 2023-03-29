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
      expect(page).to have_content('Andy')
    end
  end

  context 'Employee Actions' do 
    before(:each) do
      enployee = Employee.create(name: 'Andy', age: 18, tel: '0900333444', email: '123@gmail.com', intro: 'testing')
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
    end

    scenario 'valid Read data' do
      visit employee_path(1200)
      expect(page).to have_content("The page you were looking for doesn't exist")
    end

    scenario 'Back to Home Page after read Employee data' do
      visit employees_path
      click_on 'Andy'
      expect(page).to have_content('All Employees')
      expect(page).to have_content('Andy')
    end

    scenario 'edit Employee data' do
      click_on 'Update Info'
      expect(page).to have_content('Update Employee')
      fill_in 'Name', with: 'Robert'
      click_on 'send profile'
      expect(page).to have_content('All Employees')
      expect(page).to have_content('Robert')
    end

    scenario 'Delete Employee data' do
      click_on 'Fire Employee'
      page.driver.browser.switch_to.alert.accept
      visit employees_path
      expect(page).not_to have_content('Andy')
    end
  end
end