class Admin::DocumentsController < Admin::Auth
  active_scaffold :"document" do |config|
    config.list.per_page    = 25
    config.create.multipart = 'local'
    config.update.multipart = 'local'
    config.columns[:body].form_ui = :text_editor

    config.columns = [:title, :subtitle, :summary, :body, :front_page_image, :assets]
  end
end
