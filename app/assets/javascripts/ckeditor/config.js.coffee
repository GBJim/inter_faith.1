CKEDITOR.editorConfig = (config) ->
  
  config.uiColor = "#AADC6E"
  config.toolbar = 'Basic'
  config.removePlugins = 'elementspath';
  config.toolbar = [
  
  
   ['Bold','Italic','Underline','Font','StrikeThrough','-','Undo','Redo','-','Cut','Copy','Paste'],

   ['NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
   
   ]
  true
