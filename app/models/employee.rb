class Employee < ApplicationRecord
  the_proc = Proc.new do |instance|
    puts "the proc #{instance.inspect}"
    instance.company_id
  end
  has_closure_tree parent_column_name: :manager_id, lock_name: the_proc
end
