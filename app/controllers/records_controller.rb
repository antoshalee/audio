class RecordsController < ApplicationController
  def cache
    html_result = ""
    params[:records].each do |file|
      cache_name = cache_as_audio file
      html_result += render_to_string(partial: params[:resource], locals: {cache_name: cache_name})
    end
    render text: html_result, content_type: "text/html"
  end

  private

  def cache_as_audio file
    uploader = AudioUploader.new
    uploader.cache!(file)
    uploader.cache_name
  end
end
