if(typeof(CKEDITOR) != 'undefined')
{
 CKEDITOR.editorConfig = function(config) {
   config.toolbar = [
    [ 'Bold', 'Italic', 'Underline', 'Strike' ],
    [ 'HorizontalRule' ],
    [ 'Blockquote' ],
    [ 'Undo', 'Redo' ],
    [ 'insertResolved' ],
    { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    // [ 'Source' ]
 ];
}
} else{
  console.log("ckeditor not loaded")
}