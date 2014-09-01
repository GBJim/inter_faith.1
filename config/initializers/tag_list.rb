module Tag_list

  class Application < Rails::Application
    ActsAsTaggableOn.force_lowercase = true
    ActsAsTaggableOn.delimiter = ' '
    
  end
end