class Employee < ApplicationRecord
  the_proc = Proc.new do |instance|
    puts "the proc #{instance.inspect}"
    instance.company_id
  end
  if ENV['USE_LOCK_NAME']
    has_closure_tree parent_column_name: :manager_id, lock_name: the_proc
  else
    has_closure_tree parent_column_name: :manager_id
  end
end
