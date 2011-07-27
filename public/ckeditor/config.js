

CKEDITOR.editorConfig = function( config )
{

	config.language = 'it';

	
	// config.toolbar_Full =
	// [
	// 	{ name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
	// 	{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
	// 	{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
	// 	{ name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 
	// 
	//          'HiddenField' ] },
	// 	'/',
	// 	{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
	// 	{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-
	// 
	//         ','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
	// 	{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
	// 	{ name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
	// 	'/',
	// 	{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
	// 	{ name: 'colors', items : [ 'TextColor','BGColor' ] },
	// 	{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
	// ];
	// 
	// config.toolbar_Develon =
	//       [
	//           ['Source','-','Preview','Templates'],
	//           
	//           ['Maximize','-','About'],
	//           // ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	//           //['Styles','Format'],
	//           ['Format','Font','FontSize'],
	//           ['TextColor','BGColor'],
	//           ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
	//           ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
	//           ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	//           ['Link','Unlink','Anchor'],
	//           ['Image','Embed','Flash','Attachment','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
	//       ];
	
	config.toolbar_Basic =
	[ ['Source'],
	  ['Cut','Copy','PasteText','SpecialChar'],
	 
		['Bold', 'Italic', 'TextColor', 'NumberedList', 'BulletedList']
	];
	config.toolbar = 'Basic';
	config.enterMode = CKEDITOR.ENTER_BR;
	config.theme = 'default';

};
