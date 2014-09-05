(function() {
  CKEDITOR.editorConfig = function(config) {
    config.toolbar = 'Basic';
    config.removePlugins = 'elementspath';
    config.toolbar = [['Bold', 'Italic', 'Underline', 'Font', 'StrikeThrough', '-', 'Undo', 'Redo', '-', 'Cut', 'Copy', 'Paste'], ['NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']];
    return true;
  };

}).call(this);
