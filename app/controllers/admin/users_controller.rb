class Admin::UsersController < Admin::Auth

  columns = [:image_url, :name, :role, :first_name, :last_name, :email, :postal_code, :contact, :artists]

  active_scaffold :"user" do |config|
    config.columns = columns
    config.list.columns = columns + [:aasm_state]
    config.update.columns.exclude(:artists, :image_url, :gender)
    config.create.columns.exclude(:artists, :image_url, :gender)
    config.actions.exclude :create


    #config.create.columns = columns - [:name, :first_name, :last_name, :email, :postal_code ]
    #config.update.columns = columns - [ :name, :first_name, :last_name, :email, :postal_code]

#=begin
    #binding.pry
    #if current_user.is?(:admin)
      config.columns.add(:role)
      config.columns[:role].form_ui = :select
      config.columns[:role].options = {
       include_blank: 'Select Role',
       options: User::ROLES }
    #end
#=end


    config.columns[:updated_at].label = "Last Login"
  end
end
