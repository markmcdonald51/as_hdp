class Admin::CategoriesController < Admin::Auth #< ApplicationController

  active_scaffold :"category" do |config|
    config.create.multipart = 'local'
    config.update.multipart = 'local'

    config.columns = [:name, :attachment, :description]
    config.columns.exclude(:parent, :created_at, :updated_at)
    config.create.columns = [:name, :attachment, :description, :attachment]
    config.update.columns = [:name, :attachment, :description, :attachment]

    config.list.columns = [:name, :attachment, :items]

    config.nested.add_scoped_link(:children)  #nested link to children
    #config.columns[:description].form_ui = :text_editor
  end


  #def conditions_for_collection
#     unless current_user.role == 'admin' # if you want to limit records for non admin users
#      # ['customer_accounts.active is ?', true]
#      ['user_id: = ?', current_user.id]
#     end
#  end

  protected

  # If nested let active_scaffold manage everything
  # if not just show all root nodes
  def beginning_of_chain
    nested? ? super : active_scaffold_config.model.roots
  end

  # Assign parent node to just created node
  def after_create_save(record)
    if (nested? && nested.scope)
      parent = nested_parent_record(:read)
      record.send("#{nested.scope}").send(:<<, parent) unless parent.nil?
    end
  end

end
