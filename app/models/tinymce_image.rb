class TinymceImage < ActiveRecord::Base

	has_attached_file 	:file,
						path: ':rails_root/public/images/articles/:class/:id/:style/:filename',
						url: '/images/:id/:style.:extension',
						styles: {
							adapted: "680x510"
						},
						convert_options: {
							adapted: "-quality 75 -strip"
						}

	validates_attachment_content_type	:file, :content_type => /\Aimage/

end
