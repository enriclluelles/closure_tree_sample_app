task :lock => :environment do
  ActiveRecord::Base.connection.execute("set global innodb_lock_wait_timeout=3")
  Company.delete_all
  Employee.delete_all
  Employee.rebuild!
  companies = 10.times.map do |i|
    Company.create(name: "company #{i}")
  end
  t = []
  companies.each do |c|
    t << Thread.new do
      Employee.transaction do
        e1 = nil
        30.times do
          puts "creating employee for #{c.inspect}"
          e1 = Employee.create(name: "Employee #{rand * 100}", company_id: c.id, manager_id: e1&.id)
        end
      end
    end
  end
  t.map(&:join)
end
