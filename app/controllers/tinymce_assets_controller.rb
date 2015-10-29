class TinymceAssetsController < ApplicationController
	
	def create

		geometry = Paperclip::Geometry.from_file params[:file]
		image    = TinymceImage.create params.permit(:file, :alt, :hint)

		logger.info("IMAGE URL: #{image.file.url(:adapted)}")

		render json: {
			image: {
				url: image.file.url(:adapted),
				height: geometry.height.to_i,
				width: geometry.width.to_i
			}
		}, layout: false, content_type: "text/html"
	end

	def show
		@image = TinymceImage.find(params[:id])
		send_file @image.file.path(params[:style].to_sym), type: @image.file_content_type, disposition: 'inline'
	end

end
