class DemosController < ApplicationController
  def cache
    html_result = ""
    params[:demos].each do |file|
      cache_name = cache_as_audio file
      html_result += render_to_string(partial: "demo_block", locals: {cache_name: cache_name})
    end
    render text: html_result, content_type: "text/html"
  end

  private

  def cache_as_audio file
    uploader = AudioUploader.new
    uploader.cache!(file)
    uploader.cache_name
    # {name: uploader.cache_name, size: uploader.size, content_type: uploader.file.content_type, url: "/attachments/get_temp_image?name=#{uploader.cache_name}&content_type=#{uploader.file.content_type}", thumbnail_url: "/attachments/get_temp_image?name=#{uploader.thumb.cache_name}&content_type=#{uploader.file.content_type}"}
  end
end
