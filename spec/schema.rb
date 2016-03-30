ActiveRecord::Schema.define do
  # ------------------------------------------------------------------- #
  #                                                                     #
  #   Please keep these create table statements in alphabetical order   #
  #   unless the ordering matters.  In which case, define them below.   #
  #                                                                     #
  # ------------------------------------------------------------------- #

  create_table :users, force: true do |t|
    t.string :name
  end
end

