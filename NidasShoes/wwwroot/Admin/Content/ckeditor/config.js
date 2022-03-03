/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    config.language = "en";
    config.filebrowserBrowseUrl = "/Admin/Home/FileBrower";
    config.filebrowserUploadUrl = "/Admin/Home/UploadFileImage";
    config.filebrowserImageUploadUrl = "/Admin/Home/UploadFileImage";
    //config.filebrowserFlashUploadUrl = "/Content/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash";
};
