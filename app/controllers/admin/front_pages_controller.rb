class Admin::FrontPagesController < Admin::Auth
  active_scaffold :"front_page" do |config|

    config.list.per_page    = 25
    config.create.multipart = 'local'
    config.update.multipart = 'local'
    config.columns[:layout].form_ui = :select
    #config.columns[:template].options = {
    # include_blank: 'Select Contract Cash Recipient',
    # options: User::ROLES }

  end
end
