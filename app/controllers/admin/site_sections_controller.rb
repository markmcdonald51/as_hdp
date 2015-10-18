class Admin::SiteSectionsController <  Admin::Auth
  active_scaffold :"site_section" do |config|

    config.columns = [:name, :subheading, :image, :items]
    config.list.columns = [:name, :visible, :subheading, :image, :items]
    config.create.columns = [:name, :subheading, :summary, :visible, :image]
    config.update.columns = [:name, :subheading, :summary, :visible, :image]
    #config.update.columns = [:name, :layout]
    #config.create.columns = [:name, :layout]
    #config.list.columns = [:document, :]


    #config.columns[:image].list_ui = :thumbnail
    config.list.per_page    = 25
    config.create.multipart = 'local'
    config.update.multipart = 'local'

    #config.columns[:description].form_ui = :text_editor
    #config.columns[:layout].form_ui = :chosen
    #config.columns[:artists].form_ui = :chosen

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
