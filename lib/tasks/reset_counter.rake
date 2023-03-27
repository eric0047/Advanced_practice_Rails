namespace :db do
  desc 'Reset Counter'
  task :reset_counter => :environment do
    puts  'reset'
    Employee.all.each do |candidate|
      Employee.reset_counters(candidate.id, :good_job_logs)
    end
    puts 'Done'
  end
end