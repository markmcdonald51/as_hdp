class Admin::ArtistsController < Admin::Auth

  columns = [ :name, :subtitle, :summary, :layout,
    :front_page_image, :assets, :categories]

  active_scaffold :"artist" do |config|

    config.action_links.add 'crop_image', :label => 'Crop Image', :page => true,
     :type => :member, :parameters => {:size => '800x400'}


    #config.nested.add_link(:reports, label: 'Documents')
    #config.nested.add_link(:deposits, label: 'Deposits')

    config.columns = columns
    #config.list.columns = [:position] + columns
    config.update.columns.exclude(:categories)
    config.create.columns.exclude(:categories)

    config.list.per_page    = 25
    config.create.multipart = 'local'
    config.update.multipart = 'local'
    config.columns[:layout].form_ui = :chosen
    #config.columns[:site_section].form_ui = :chosen
    #config.columns[:user].form_ui = :chosen
    #config.columns[:usage].form_ui = :hidden
    #config.columns[:summary].form_ui = :text_editor

  end

  def crop_image
    @artist = Artist.find(params[:id])
  end

  def attributes_hash_is_empty?(hash, klass)
     if klass == Attachment
       super(hash.except(:usage), klass)
     else
       super
     end
   end
end
